class Approval < ApplicationRecord
  belongs_to :approvable, polymorphic: true
  belongs_to :user_action

  scope :for,       ->(object) {where(approvable_type: object)}
  scope :current,   -> { where(approved_at: nil, rejected_at: nil) }
  scope :approved,  -> { where("approved_at IS NOT NULL") }
  scope :rejected,  -> { where("rejected_at IS NOT NULL") }
  scope :historic,  -> { where("approved_at IS NOT NULL OR rejected_at IS NOT NULL") }
  scope :latest,    -> { order("created_at DESC") }
  scope :by_user, ->(user) { where(user_id: user) }

  def accepted?
    !self.approved_at.nil? ? true : false
  end

  def rejected?
    !self.rejected_at.nil? ? true : false
  end

  # Returns +true+ if this Approval has been responded to in some way, either rejected or accepted.
  # @see {#accepted?} and {#rejected?}
  def actioned?
    accepted? == true || rejected? == true ? true : false
  end

  # Updates the timestamp to indicate the object has been accepted
  def accept!(user_id=nil)
    if self.approved_at.nil?
      self.activate_approvable
      # Approvability::Notifier.confirm_approval(self).deliver # Send an email to the contributor
      self.update_attributes(rejected_at: nil, approved_at: Time.now, user_id: user_id)
    end
    self
  end

  # Updates the timestamp to indicate the object has been rejected
  def reject!(user_id=nil)
    if self.rejected_at.nil?
      self.deactivate_approvable
      self.update_attributes(rejected_at: Time.now, approved_at: nil, user_id: user_id)
    end
    self
  end

  def rollback_approval!
    self.deactivate_approvable
    if !self.rejected_at.nil? || !self.approved_at.nil?
      self.update_attributes(rejected_at: nil, approved_at: nil, user_id: nil)
    end
    self
  end

  # Changes the status of the approvable object
  def toggle_activity
    self.approvable.toggle! :active
  end

  def activate_approvable
    self.approvable.update_attributes!(active: true)
  end

  def deactivate_approvable
    self.approvable.update_attributes!(active: false)
  end

end

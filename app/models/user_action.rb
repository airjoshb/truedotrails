class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_step, counter_cache: true
  has_one :challenge, through: :challenge_step
  has_one :approval, dependent: :destroy
  
  has_one_attached :attachment

  # validates :attachment, attached: true, unless: :proof
  validates :proof, presence: true, unless: :attachment

  before_validation :init_action, on: :create
  after_validation :init_complete, on: :create
  after_save :init_approval, on: :create

  scope :by_user, ->(user) { where(user_id: user) }
  scope :by_challenge, ->(challenge) { joins(:challenge).where('challenges.id = ?', challenge.id) }
  scope :started, -> { where.not(start_date: nil) }
  scope :completed, -> { where.not(end_date: nil) }
  scope :not_completed, -> { where(end_date: nil) }
  scope :approved, -> { joins(:approval).where("approvals.approved_at IS NOT NULL") }
  scope :not_approved, -> { joins(:approval).where("approvals.approved_at IS NULL") }
  scope :active, -> { started.not_approved }
  
  def init_action
    self.start_date = Time.zone.now
  end  

  def init_complete
    self.end_date = Time.zone.now
  end  

  def init_approval
    approval = Approval.create(user_action: self)
  end

  def self.started?
    started.present?
  end

  def self.active?
    active.present?
  end

  def self.complete?
    where.not(end_date: nil).present?
  end

  def self.approved?
    joins(:approval).where("approvals.approved_at IS NOT NULL")
  end



end

class ChallengeStep < ApplicationRecord
  has_one :content, as: :contentable
  belongs_to :challenge
  has_many :user_actions

  has_one_attached :attachment
  accepts_nested_attributes_for :content, allow_destroy: true

  default_scope -> { order(created_at: :asc) }


  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  def normalize_friendly_id(string)
    string.to_s.gsub("\'", "").parameterize.delete("'")
  end
end

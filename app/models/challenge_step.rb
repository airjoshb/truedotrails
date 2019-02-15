class ChallengeStep < ApplicationRecord
  has_one :content, as: :contentable
  belongs_to :challenge
  has_many :user_actions
  

  validates :seq_number, presence: true

  has_one_attached :attachment
  has_one_attached :video
  
  accepts_nested_attributes_for :content, allow_destroy: true

  default_scope -> { order(seq_number: :asc) }


  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  def normalize_friendly_id(string)
    string.to_s.gsub("\'", "").parameterize.delete("'")
  end

  def prev
    challenge.challenge_steps.where("seq_number < ?", seq_number).order(:seq_number).last
  end

  def next
    challenge.challenge_steps.where("seq_number > ?", seq_number).order(:seq_number).first
  end
end

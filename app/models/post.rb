class Post < ApplicationRecord
  has_one :content, as: :contentable

  has_one_attached :attachment
  accepts_nested_attributes_for :content, allow_destroy: true


  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  def normalize_friendly_id(string)
    string.to_s.gsub("\'", "").parameterize.delete("'")
  end
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :user_id, presence: true
  validates :challenge_id, presence: true
  
  default_scope -> { order(created_at: :desc) }
end

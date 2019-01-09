class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_step
  has_one :approval, as: :approvable
end

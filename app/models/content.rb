class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true

  has_one_attached :attachment

  
end

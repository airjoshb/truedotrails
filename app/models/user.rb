class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable, :confirmable

  has_person_name

  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_many :user_actions, dependent: :destroy
  has_many :clam_credits, dependent: :destroy
  has_many :approvals, through: :user_actions

end

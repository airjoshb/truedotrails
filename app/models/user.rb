class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable, :confirmable

  has_person_name

  # belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  # has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  # validates :referral_code, uniqueness: true

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_actions, dependent: :destroy
  has_many :clam_credits, dependent: :destroy
  has_many :approvals, through: :user_actions

  before_create :generate_token

  def started_challenge?(challenge)
    self.user_actions.joins(:challenge).where('challenges.id = ?', challenge.id).started? ? true : false
  end

  def completed_challenge?(challenge)
    steps = challenge.challenge_steps.count
    actions = self.user_actions.joins(:challenge).where('challenges.id = ?', challenge.id).approved.count
    steps == actions ? true : false
  end

  def completed_challenges
    count = 0
    for c in Challenge.all
      steps = c.challenge_steps.count
      actions = self.user_actions.joins(:challenge).where('challenges.id = ?', c.id).approved.count
      if steps == actions
        count += count
      end
    end
    count
  end

  def started_step?(step)
    self.user_actions.where(challenge_step: step.id).active? ? true : false
  end

  def completed_step?(step)
    self.user_actions.where(challenge_step: step.id).complete?
  end

  def approved_step?(step)
    self.user_actions.where(challenge_step: step.id).approved?
  end

  def active_challenges
    self.user_actions.active
  end

  private

  def generate_token
    self.referral_code = loop do
      random_token = SecureRandom.hex(3)
      break random_token unless self.class.exists?(referral_code: random_token)
    end
  end

  protected
    def password_required?
      confirmed? ? super : false
    end

end

class ClamCredit < ApplicationRecord
  belongs_to :user
  validates :amount, :user_id, :reason,:operation, :type, :balance, :transaction_id, presence: true
  validates :amount, :balance, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :transaction_id, uniqueness: true, allow_blank: true

  before_validation :generate_transaction_id, on: :create
  before_create :update_user_wallet

  enum operation: [:debit, :credit]

  private
    def update_user_wallet
      user.update_attribute(:clam_credits_total, balance)
    end

    def generate_transaction_id
      begin
        self.transaction_id = (Time.now.strftime("%s") + rand(999999).to_s).to(15)
      end
    end

end

class AddClamCreditsTotalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :clam_credits_total, :integer, default: 0
  end
end

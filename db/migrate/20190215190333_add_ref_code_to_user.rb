class AddRefCodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :referral_code, :string
    add_column :users, :referrer_id, :integer
  end
end

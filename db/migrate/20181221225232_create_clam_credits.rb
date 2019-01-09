class CreateClamCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :clam_credits do |t|
      t.string :reason
      t.string :transaction_id
      t.integer :amount
      t.integer :balance
      t.integer :operation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

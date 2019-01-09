class CreateUserActions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_actions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active
      t.string :proof
      t.references :user, foreign_key: true
      t.references :challenge_step, foreign_key: true

      t.timestamps
    end
  end
end

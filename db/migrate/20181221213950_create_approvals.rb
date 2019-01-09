class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.references :approvable, polymorphic: true
      t.datetime :approved_at
      t.text :notes
      t.datetime :rejected_at
      t.references :user_action, foreign_key: true

      t.timestamps
    end
  end
end

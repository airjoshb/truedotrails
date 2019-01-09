class CreateChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_steps do |t|
      t.string :title
      t.references :challenge
      t.timestamps
    end
  end
end

class AddSeqNumberToChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_steps, :seq_number, :integer
  end
end

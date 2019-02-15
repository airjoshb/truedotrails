class AddUserActionCountToChallengeSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_steps, :user_actions_count, :integer, :default => 0
  end
end

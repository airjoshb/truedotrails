class AddPrivateToUserActions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_actions, :private, :boolean
  end
end

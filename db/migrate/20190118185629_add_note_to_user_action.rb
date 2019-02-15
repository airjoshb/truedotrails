class AddNoteToUserAction < ActiveRecord::Migration[5.2]
  def change
    add_column :user_actions, :note, :text
  end
end

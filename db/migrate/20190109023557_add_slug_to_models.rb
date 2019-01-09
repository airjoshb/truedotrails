class AddSlugToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :slug, :string
    add_index :challenges, :slug, unique: true
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
    add_column :challenge_steps, :slug, :string
    add_index :challenge_steps, :slug, unique: true
  end
end

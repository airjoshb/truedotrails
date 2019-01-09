class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :body
      t.text :lede
      t.references :contentable, polymorphic: true

      t.timestamps
    end
  end
end

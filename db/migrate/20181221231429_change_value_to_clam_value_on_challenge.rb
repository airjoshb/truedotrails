class ChangeValueToClamValueOnChallenge < ActiveRecord::Migration[5.2]
  def change
    rename_column :challenges, :value, :clam_value
  end
end

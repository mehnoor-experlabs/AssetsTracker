class AddUserIdToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :user_id, :integer
    add_index :assets, :user_id
  end
end

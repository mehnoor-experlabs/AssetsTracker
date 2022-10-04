class AddPasswordToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :password, :string
  end
end

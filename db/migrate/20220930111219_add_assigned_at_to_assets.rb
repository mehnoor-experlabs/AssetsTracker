class AddAssignedAtToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :assigned_at, :date
  end
end

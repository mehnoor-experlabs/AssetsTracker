class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.text :description
      t.date :purchase_date
      t.string :purchased_from
      t.string :serial_number
      t.string :purchase_type
      t.string :condition_score

      t.timestamps
    end
  end
end

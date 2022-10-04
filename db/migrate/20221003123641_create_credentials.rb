class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :credentiable_type
      t.integer :credentiable_id
      t.string :password

      t.timestamps
    end
  end
end

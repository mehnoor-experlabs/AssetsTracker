class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.string :body
      t.references :asset, foreign_key: true

      t.timestamps
    end
  end
end

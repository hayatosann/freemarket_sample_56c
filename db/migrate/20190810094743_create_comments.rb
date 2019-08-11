class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :purchase_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

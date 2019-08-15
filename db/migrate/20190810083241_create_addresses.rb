class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false, unique: true
      t.string :city, null: false
      t.string :block, null: false
      t.string :building, null: true
      t.integer :sub_phone, null: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    # add_index :addresses, :user_id
  end
end

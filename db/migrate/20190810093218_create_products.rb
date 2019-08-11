class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :size_id, null: false
      t.integer :brand_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipping_method, null: false
      t.integer :prefecture_from, null: false
      t.integer :shipping_days, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end

class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :buyer_id, null: false, foreign_key: true
      t.integer :seller_id, null: false, foreign_key: true
      t.integer :postage_by, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end

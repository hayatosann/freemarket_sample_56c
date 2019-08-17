class RenameSellerIdColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :seller_id, :product_id
  end
end

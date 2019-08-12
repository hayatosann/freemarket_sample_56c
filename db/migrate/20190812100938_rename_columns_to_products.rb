class RenameColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :shipping_method, :shipping_method_id
    rename_column :products, :prefecture_from, :prefecture_from_id
    rename_column :products, :shipping_days, :shipping_days_id
  end
end

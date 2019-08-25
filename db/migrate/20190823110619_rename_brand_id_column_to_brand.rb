class RenameBrandIdColumnToBrand < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :brand_id, :brand
  end
end

class AddColumnSalesStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sales_status, :integer
  end
end

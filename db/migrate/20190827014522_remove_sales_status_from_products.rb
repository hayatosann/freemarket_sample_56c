class RemoveSalesStatusFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sales_status, :integer
  end
end

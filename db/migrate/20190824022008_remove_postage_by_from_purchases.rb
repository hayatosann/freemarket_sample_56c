class RemovePostageByFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :postage_by, :integer
    remove_column :purchases, :status, :integer
  end
end

class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :brand, :string, null: true
  end

  def down
    change_column :products, :brand, :string, null: false
  end
end

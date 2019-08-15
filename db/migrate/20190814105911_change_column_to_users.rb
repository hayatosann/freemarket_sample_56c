class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string, null: true
  end
end

class ChangeColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postal_code, :string
    change_column :addresses, :sub_phone, :string, null: true
  end
end
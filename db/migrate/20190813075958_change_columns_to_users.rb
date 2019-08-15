class ChangeColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :integer, null: true
    change_column :users, :image, :string, null: true
    change_column :users, :profile, :text, null: true
  end
end

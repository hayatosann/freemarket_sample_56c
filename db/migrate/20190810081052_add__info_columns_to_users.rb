class AddInfoColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false, unique: true
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :phone, :integer, null: false, unique: true
    add_column :users, :image, :string, null: false
    add_column :users, :profile, :text, null: false
  end
end
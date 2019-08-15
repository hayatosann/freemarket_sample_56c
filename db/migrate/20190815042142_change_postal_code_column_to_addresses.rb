class ChangePostalCodeColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :postal_code, :string
  end
end

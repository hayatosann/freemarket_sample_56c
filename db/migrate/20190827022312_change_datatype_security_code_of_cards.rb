class ChangeDatatypeSecurityCodeOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :security_code, :string
  end
end

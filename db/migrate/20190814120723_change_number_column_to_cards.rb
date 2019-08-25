class ChangeNumberColumnToCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :number, :string
  end
end

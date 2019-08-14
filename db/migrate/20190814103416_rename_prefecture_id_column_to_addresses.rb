class RenamePrefectureIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :prefecture, :prefecture_id
  end
end

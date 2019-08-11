class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number, null: false
      t.date :expiration_date, null: false
      t.integer :security_code, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

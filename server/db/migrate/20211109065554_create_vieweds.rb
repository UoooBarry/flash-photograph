class CreateVieweds < ActiveRecord::Migration[6.1]
  def change
    create_table :vieweds do |t|
      t.references :photograph, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePhotographs < ActiveRecord::Migration[6.1]
  def change
    create_table :photographs do |t|
      t.references :device, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end

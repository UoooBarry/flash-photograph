class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :fingerpint
      t.string :user_agent
      t.string :last_ip

      t.timestamps
    end
  end
end

class AddSystemDevice < ActiveRecord::Migration[6.1]
  def change
    Device.create!(user_agent: 'System', last_ip: '0.0.0.0')
  end
end

class ChangeDeviceIdToNullofPhotograph < ActiveRecord::Migration[6.1]
  def change
    change_column_null :photographs, :device_id, true
  end
end

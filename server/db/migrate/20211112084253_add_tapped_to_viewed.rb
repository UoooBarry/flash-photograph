class AddTappedToViewed < ActiveRecord::Migration[6.1]
  def change
    add_column :vieweds, :tapped, :boolean
  end
end

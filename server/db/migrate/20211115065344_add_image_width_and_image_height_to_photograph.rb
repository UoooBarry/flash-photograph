class AddImageWidthAndImageHeightToPhotograph < ActiveRecord::Migration[6.1]
  def change
    add_column :photographs, :image_width, :integer
    add_column :photographs, :image_height, :integer
  end
end

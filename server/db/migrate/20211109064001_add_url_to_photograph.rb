class AddUrlToPhotograph < ActiveRecord::Migration[6.1]
  def change
    add_column :photographs, :url, :string
  end
end

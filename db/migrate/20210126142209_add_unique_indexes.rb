class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :content_pages, :title, unique: true
  end
end

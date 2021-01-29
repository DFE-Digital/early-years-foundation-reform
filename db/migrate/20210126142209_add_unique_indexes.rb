class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :content_pages, :title, unique: true
    add_index :content_pages, :slug, unique: true
  end
end

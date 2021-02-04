class AddIndexToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_index :content_pages, :position, unique: true
  end
end

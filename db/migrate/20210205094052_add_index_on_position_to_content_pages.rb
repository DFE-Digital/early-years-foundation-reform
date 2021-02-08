class AddIndexOnPositionToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_index :content_pages, %i[position parent_id], unique: true
  end
end

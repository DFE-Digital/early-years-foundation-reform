class AddIndexOnPositionToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_index :content_pages, [:position, :parent_id], unique: true
  end
end

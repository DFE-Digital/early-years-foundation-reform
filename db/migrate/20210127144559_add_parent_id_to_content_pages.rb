class AddParentIdToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :parent_id, :integer
    add_column :content_pages, :position, :integer
  end
end

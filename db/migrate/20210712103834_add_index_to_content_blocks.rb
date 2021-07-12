class AddIndexToContentBlocks < ActiveRecord::Migration[6.1]
  def change
    add_index :content_blocks, :name
  end
end

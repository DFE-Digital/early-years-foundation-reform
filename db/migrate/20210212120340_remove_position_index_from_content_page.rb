class RemovePositionIndexFromContentPage < ActiveRecord::Migration[6.1]
  def up
    remove_index :content_pages, name: "index_content_pages_on_position"
  end

  def down
    add_index :content_pages, :position, unique: true
  end
end

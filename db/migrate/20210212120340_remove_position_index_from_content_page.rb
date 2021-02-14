class RemovePositionIndexFromContentPage < ActiveRecord::Migration[6.1]
  def change
    remove_index :completions, name: "index_content_pages_on_position"
  end
end

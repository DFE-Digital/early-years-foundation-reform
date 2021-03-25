class AddPaginationToContentPages < ActiveRecord::Migration[6.1]
  def self.up
    add_column :content_pages, :next_id, :integer
    add_column :content_pages, :previous_id, :integer
  end

  def self.down
    remove_column :content_pages, :next_id
    remove_column :content_pages, :previous_id
  end
end

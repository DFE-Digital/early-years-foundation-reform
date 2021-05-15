class AddSiteToContentPages < ActiveRecord::Migration[6.1]
  def up
    add_column :content_pages, :site_id, :integer
    add_index  :content_pages, :site_id
  end
end

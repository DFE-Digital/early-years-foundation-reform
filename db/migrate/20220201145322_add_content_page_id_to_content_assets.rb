class AddContentPageIdToContentAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :content_assets, :content_page_id, :integer
  end
end

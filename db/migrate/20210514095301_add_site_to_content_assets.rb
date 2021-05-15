class AddSiteToContentAssets < ActiveRecord::Migration[6.1]
  def up
    add_column :content_assets, :site_id, :integer
    add_index  :content_assets, :site_id
  end
end

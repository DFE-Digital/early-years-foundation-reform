class AddPageNameToContentAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :content_assets, :page_name, :string
  end
end

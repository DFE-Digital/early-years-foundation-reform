class RemovePageNameFromContentAssets < ActiveRecord::Migration[6.1]
  def change
    remove_column :content_assets, :page_name, :string
  end
end

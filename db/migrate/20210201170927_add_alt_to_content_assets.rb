class AddAltToContentAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :content_assets, :alt, :string
  end
end

class AddAltToContentAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :content_assets, :alt_text, :string, null: false, default: ""
  end
end

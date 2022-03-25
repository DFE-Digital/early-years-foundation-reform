class AddContentListToContentPageVersions < ActiveRecord::Migration[6.1]
  def change
    add_column :content_page_versions, :content_list, :string
  end
end

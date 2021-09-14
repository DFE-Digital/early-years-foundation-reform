class AddAuthorToContentPageVersions < ActiveRecord::Migration[6.1]
  def change
    add_column :content_page_versions, :author, :string
  end
end

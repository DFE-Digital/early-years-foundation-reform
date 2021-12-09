class AddDescriptionToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :description, :string
    add_column :content_page_versions, :description, :string
  end
end

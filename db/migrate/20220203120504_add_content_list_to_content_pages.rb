class AddContentListToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :content_list, :string
  end
end

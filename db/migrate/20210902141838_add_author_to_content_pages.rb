class AddAuthorToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :author, :string
  end
end

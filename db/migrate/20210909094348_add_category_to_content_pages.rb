class AddCategoryToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :category, :string
  end
end

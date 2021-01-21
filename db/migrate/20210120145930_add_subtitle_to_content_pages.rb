class AddSubtitleToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :subtitle, :string
  end
end

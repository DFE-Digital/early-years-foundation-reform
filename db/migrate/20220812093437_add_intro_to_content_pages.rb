class AddIntroToContentPages < ActiveRecord::Migration[6.1]
  def change
    add_column :content_pages, :intro, :string
  end
end

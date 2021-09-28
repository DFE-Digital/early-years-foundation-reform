class AddAltTextForImages < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :featured_alt_text, :string
    add_column :articles, :thumbnail_alt_text, :string
  end
end

class AddAltTextForImages < ActiveRecord::Migration[6.1]
  def change
    change_table :articles, bulk: true do
      add_column :featured_alt_text, :string
      add_column :thumbnail_alt_text, :string
    end
  end
end

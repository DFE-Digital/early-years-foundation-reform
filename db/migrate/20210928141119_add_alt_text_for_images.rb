class AddAltTextForImages < ActiveRecord::Migration[6.1]
  def change
    change_table :articles, bulk: true do |t|
      t.string :featured_alt_text
      t.string :thumbnail_alt_text
      t.string :author
      t.datetime :published_at
    end
  end
end

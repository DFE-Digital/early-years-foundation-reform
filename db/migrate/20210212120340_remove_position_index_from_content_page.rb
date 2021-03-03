class RemovePositionIndexFromContentPage < ActiveRecord::Migration[6.1]
  def up
    remove_column :content_pages, bulk: true do |t|
      t.string  :seo
      t.string  :subtitle
    end
  end

  def down
    add_column :content_pages, bulk: true do |t|
      t.string  :seo
      t.string  :subtitle
    end
  end
end

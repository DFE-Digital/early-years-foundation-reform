class AddFeaturedToContentPages < ActiveRecord::Migration[6.1]
  change_table :content_pages, bulk: true do |t|
    t.boolean :is_featured
  end
end

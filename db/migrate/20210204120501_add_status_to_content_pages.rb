class AddStatusToContentPages < ActiveRecord::Migration[6.1]
  change_table :content_pages, bulk: true do |t|
    t.string :published_status
  end
end

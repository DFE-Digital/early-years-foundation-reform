class AddUnpublishedAtToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :unpublished_at, :datetime
  end
end

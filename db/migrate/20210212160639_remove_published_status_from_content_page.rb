class RemovePublishedStatusFromContentPage < ActiveRecord::Migration[6.1]
  def change
    remove_column :content_pages, :published_status, :string
  end
end

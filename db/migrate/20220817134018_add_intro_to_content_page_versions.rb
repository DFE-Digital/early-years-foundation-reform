class AddIntroToContentPageVersions < ActiveRecord::Migration[6.1]
  def change
    add_column :content_page_versions, :intro, :string
  end
end

class CreateTableContentPageVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :content_page_versions do |t|
      t.references :content_page

      t.string :title
      t.string :markdown

      t.timestamps
    end
  end
end

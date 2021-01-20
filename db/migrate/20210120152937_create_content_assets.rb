class CreateContentAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :content_assets do |t|
      t.string :title

      t.timestamps
    end
  end
end

class DeleteActiveStorageTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :active_storage_variant_records do |t|
      t.belongs_to :blob, null: false, index: false
      t.string :variation_digest, null: false
      t.index %i[blob_id variation_digest], name: "index_active_storage_variant_records_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
      t.timestamps
    end
    drop_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false
      t.timestamps
      t.index %i[record_type record_id name blob_id], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
    drop_table :active_storage_blobs do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum,     null: false
      t.timestamps
      t.index [:key], unique: true
    end
    drop_table :content_assets do |t|
      t.string :title
      t.string :alt_text
      t.integer :content_page_id
      t.timestamps
    end
    drop_table :articles do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.string :markdown

      t.timestamps
      t.index :slug, unique: true
    end
  end
end

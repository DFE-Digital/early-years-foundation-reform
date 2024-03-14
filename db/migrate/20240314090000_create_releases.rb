class CreateReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :releases do |t|
      t.string :name, null: false
      t.jsonb :properties, default: {}, null: false
      t.datetime :time, null: false
    end

    add_index :releases, %i[name time]
    add_index :releases, :properties, using: :gin, opclass: :jsonb_path_ops
  end
end

class AddSubdomainToSite < ActiveRecord::Migration[6.1]
  change_table :sites, bulk: true do |t|
    t.string :subdomain
  end
end

n_sites = 12

n_sites.times do
  site = FactoryBot.create( :site )

  n_pages = 1 + rand(12)
  n_pages.times do
    page = FactoryBot.create( :content_page, site_id: site.id, title: Faker::Commerce.product_name )
  end
end

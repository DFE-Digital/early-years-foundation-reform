# Create seed data for the seven areas of learning
# The seed data is so big that we decided to put them
# in separate seed file for each area

ContentPage.destroy_all

Dir[Rails.root.join("db/seeds/*.rb")].sort.each do |seed|
  load seed
end

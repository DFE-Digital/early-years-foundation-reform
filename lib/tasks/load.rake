desc "Load new content to database"
namespace :load do
  desc "Safeguarding and welfare"
  task :safeguarding => :environment do |_, args|
    title = "Safeguarding and welfare"
    puts "create => #{title}"
    attrs = I18n.t("content.safeguarding")
    ContentPage.new(attrs) do |parent_page|
      parent_page.save!
      {oral_health: "Oral health", food_safety: "Food safety"}.each do |key, title|
        puts "create => #{title}"
        ContentPage.create_or_find_by(title: title) do |child_page|
          attrs = I18n.t("content.#{key}")
          puts attrs.inspect
          child_page.update(attrs)
          child_page.parent_id = parent_page.id
          puts child_page.inspect
          child_page.save!
        end
      end
    end
  end
end
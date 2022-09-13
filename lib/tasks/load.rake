desc "Load new content to database"
namespace :load do
  desc "Safeguarding and welfare"
  task safeguarding: :environment do |_, _args|
    attrs = I18n.t("content.safeguarding")
    ContentPage.new(attrs) do |parent_page|
      puts "Update #{parent_page.inspect}"
      parent_page.save!
      puts "Updated #{parent_page.reload.inspect}"
      { oral_health: "Oral health", food_safety: "Food safety" }.each do |key, title|
        ContentPage.new(title: title, parent_id: parent_page.id) do |child_page|
          attrs = I18n.t("content.#{key}")
          puts "Update #{child_page.inspect}"
          child_page.update!(attrs)
          puts "Updated #{child_page.reload.inspect}"
        end
      end
    rescue StandardError => e
      puts e.message
    end
  end

  desc "Load content blocks"
  task blocks: :environment do |_, _args|
    %w[landing_page_introduction other_useful_resources child_development_training].each do |content_block_name|
      unless ContentBlock.exists?(name: content_block_name)
        attrs = I18n.t("content.#{content_block_name}")
        ContentBlock.create!(name: content_block_name, **attrs)
      end
    end
  end

  desc "Load test users"
  task users: :environment do |_, _args|
    %w[brett.mchargue.admin].each do |name|
      first_name, last_name, role = name.split(".")
      user_attributes = {
        email: "#{first_name}@education.gov.uk",
        first_name: first_name,
        last_name: last_name,
        role: role,
      }
      user = User.first_or_initialize(user_attributes).tap do |admin|
        admin.password = Rails.application.credentials.test_password
      end
      user.save!
    end
  end
end

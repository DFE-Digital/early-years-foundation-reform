Seeder = Dibber::Seeder

# Note that for content pages the slug is overwritten by a construct built from the title,
# so in the YAML files the slug key needs to match title.
Seeder.monitor ContentPage

def seed_content_pages_from(path)
  Seeder.objects_from(path).each do |slug, attributes|
    content_page = ContentPage.find_or_initialize_by(slug: slug)
    attributes.merge!(parent: ContentPage.find_by(slug: attributes.delete("parent"))) if attributes["parent"].present?
    content_page.update!(attributes)
  end
end

seed_content_pages_from "content_pages/communication_and_language.yml"
seed_content_pages_from "content_pages/safeguarding_and_welfare.yml"
seed_content_pages_from "content_pages/get_help_to_improve_your_practice.yml"

Seeder.seed(:content_block)
Seeder.seed(:user, name_method: :email) if Rails.application.credentials.test_password.present?

puts Seeder.report # rubocop:disable Rails/Output
Rails.logger.info "Seeding completed"
Seeder.report.each { |line| Rails.logger.info line }

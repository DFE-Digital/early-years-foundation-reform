# :nocov:
require 'contentful/management'

#
# Populate Contentful using YAML content
#
class Upload
  extend Dry::Initializer

  option :config, default: proc { ContentfulRails.configuration }
  option :client, default: proc { Contentful::Management::Client.new(config.management_token) }

  # @return [String]
  def call
    log "space: #{config.space}"
    log "env: #{config.environment}"

    create_resource(
      name: 'home.hero.body',
      title: 'Help for early years providers',
    )

    create_resource(
      name: 'test.resource',
      title: 'Test resource',
    )

    create_page(
      slug: 'support-for-practitioners',
      'heroTitle': 'Support for practitioners',
      'heroDescription': 'Discover helpful resources and articles to help support you within your career and your setting.',
      title: 'Support for practitioners',
      'metaDescription': 'Guidance to help you in your practice, from curriculum planning to reducing paperwork.',
      placement: 'home 1',
      'pageStyle': 'cards',
    )

    create_page(
      slug: 'areas-of-learning',
      'heroTitle': 'Areas of learning',
      'heroDescription': 'Find out more about each area of learning, including activities you can do and guidance on meeting the needs of all children in your setting.',
      title: 'Areas of learning',
      'metaDescription': 'Ideas for activities to do with children across the 7 areas of learning and development in the early years foundation stage.',
      placement: 'home 2',
      'pageStyle': 'cards',
    )

    create_page(
      slug: 'wellbeing-and-enrichment',
      'heroTitle': 'Wellbeing and enrichment',
      'heroDescription': 'Discover resources to help you support children’s wellbeing and enrichment in your setting.',
      title: 'Wellbeing and enrichment',
      'metaDescription': "Resources to help you support children's health, safety and learning in your setting.",
      placement: 'home 3',
      'pageStyle': 'cards',
    )

    ContentPage.all.find_each do |page|
      log "#{page.title} create"
      entry = create_page(
        slug: page.slug,
        'heroTitle': page.title,
        'heroDescription': page.description,
        title: page.title,
        introduction: page.intro,
        'contentList': page.content_list,
        body: page.markdown,
        'metaDescription': page.description,
        placement: 'default',
        'pageStyle': 'default',
      )
      log_entry(entry)
    end

    ContentBlock.all.find_each do |block|
      log "#{block.name} create"
      block = create_page(
        slug: block.name,
        title: block.title,
        body: block.description,
      )
      log_entry(block)
    end
  end

private

  # @param message [String]
  # @return [String]
  def log(message)
    if ENV['RAILS_LOG_TO_STDOUT'].present?
      Rails.logger.info(message)
    else
      puts message
    end
  end

  # @param entry [Contentful::Management::DynamicEntry]
  # @return [String]
  def log_entry(entry)
    type = entry.sys[:contentType].id
    timestamp = entry.published_at&.strftime('%F %T')

    log "'#{type}' entry '#{entry.slug}' published @ '#{timestamp}'"
  end

  # CONTENTFUL -----------------------------------------------------------------

  # @return [Contentful::Management::DynamicEntry[page]]
  def create_page(params)
    factory.find('helpPage').entries.create(params)
  end

  # @return [Contentful::Management::DynamicEntry[page]]
  def create_resource(params)
    factory.find('helpResource').entries.create(params)
  end

  # @return [Contentful::Management::ClientContentTypeMethodsFactory]
  def factory
    @factory ||= client.content_types(config.space, config.environment)
  end
end
# :nocov:
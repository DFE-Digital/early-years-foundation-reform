# :nocov:
require 'contentful/management'

#
# Populate Contentful using YAML content
#
class Upload
  extend Dry::Initializer

  FEATURED_PAGE_TITLES = ["Get help to improve your practice", "Safeguarding and welfare"].freeze
  option :config, default: proc { ContentfulRails.configuration }
  option :client, default: proc { Contentful::Management::Client.new(config.management_token) }

  # @return [String]
  def call
    log "space: #{config.space}"
    log "env: #{config.environment}"

    support_page, wellbeing_page = ContentPage.published.where(title: FEATURED_PAGE_TITLES).order_by_position
    content_pages = ContentPage.top_level.published.order_by_position - [support_page, wellbeing_page]

    area_of_learning_pages = content_pages.map do |page|
      if page.children.any?
        sub_entries = page.children.map do |sub_page|
          log "#{sub_page.title} create"
          create_page(sub_page, [], 'side-nav')
        end
      end
      log "#{page.title} create"
      create_page(page, sub_entries, 'side-nav')
    end

    support_pages = support_page.children.map do |page|
      log "#{page.title} create"
      create_page(page)
    end

    wellbeing_pages = wellbeing_page.children.map do |page|
      log "#{page.title} create"
      create_page(page)
    end

    ContentBlock.all.find_each do |block|
      log "#{block.name} create"
      block = create_new_page(
        slug: block.name,
        title: block.description,
        body: block.markdown,
      )
      log_entry(block)
    end

    p1 = create_new_page(
      slug: 'support-for-practitioners',
      'heroTitle': 'Support for practitioners',
      'heroDescription': 'Discover helpful resources and articles to help support you within your career and your setting.',
      title: 'Support for practitioners',
      'metaDescription': 'Guidance to help you in your practice, from curriculum planning to reducing paperwork.',
      'pageStyle': 'cards',
      pages: support_pages,
    )

    p2 = create_new_page(
      slug: 'areas-of-learning',
      'heroTitle': 'Areas of learning',
      'heroDescription': 'Find out more about each area of learning, including activities you can do and guidance on meeting the needs of all children in your setting.',
      title: 'Areas of learning',
      'metaDescription': 'Ideas for activities to do with children across the 7 areas of learning and development in the early years foundation stage.',
      'pageStyle': 'cards',
      pages: area_of_learning_pages,
    )

    p3 = create_new_page(
      slug: 'wellbeing-and-enrichment',
      'heroTitle': 'Wellbeing and enrichment',
      'heroDescription': 'Discover resources to help you support children’s wellbeing and enrichment in your setting.',
      title: 'Wellbeing and enrichment',
      'metaDescription': "Resources to help you support children's health, safety and learning in your setting.",
      'pageStyle': 'cards',
      pages: wellbeing_pages,
    )

    create_new_page(
      slug: 'home',
      'heroTitle': 'Help for early years providers',
      'heroDescription': 'Guidance for people who work in early years, from the Department for Education. This site provides resources, activities and support articles for childminders and practitioners working with children in the early years.',
      title: 'Get help for your setting',
      body: 'Find helpful articles and resources to support you in your setting.',
      pages: [p1, p2, p3],
    )

    create_resource(
      name: 'ctas.signup',
      title: 'Get email alerts for new EYFS resources',
      body: 'Receive email notifications when new early years foundation stage resources are added to this website.',
      link_to_text: 'Sign up for email alerts (opens in new tab)',
      link_to: 'https://forms.office.com.mcas.ms/Pages/ResponsePage.aspx?id=yXfS-grGoU2187O4s0qC-a1INvUBHVZElO6Xg1Rw2V9UQlg3SlFPTVZIRlFaVDY5MzJQQUxQTk0yQyQlQCN0PWcu',
    )

    create_resource(
      name: 'ctas.feedback',
      title: 'Help to improve this website',
      body: 'Provide us with your feedback to help us improve this website for people who work in the early years.',
      link_to_text: 'Complete the simple feedback form',
      link_to: 'https://forms.office.com/Pages/ResponsePage.aspx?id=yXfS-grGoU2187O4s0qC-a1INvUBHVZElO6Xg1Rw2V9UM1pQNEtCN0YyVVdFVkpOUVNXNUlZNTdOUCQlQCN0PWcu',
    )

    create_resource(
      name: 'ctas.child_development_training',
      title: '',
      body: 'Other early years resources from the Department for Education

      ## Early years child development training

      Free online training providing an overview of child development and practical advice for supporting children in your setting',
      link_to_text: 'Learn more and enrol',
      link_to: 'https://child-development-training.education.gov.uk',
    )

    r1 = create_resource(
      name: 'child_development_training',
      body: 'Free online training providing an overview of child development and practical advice for supporting children in your setting.',
      link_to_text: 'Early years child development training',
      link_to: 'https://child-development-training.education.gov.uk',
    )

    r2 = create_resource(
      name: 'eyfs_statuatory_framework',
      link_to_text: 'Early years foundation stage (EYFS) statutory framework',
      link_to: '#',
      body: 'The standards that school and childcare providers must meet for the learning, development and care of children from birth to 5.',
    )

    r3 = create_resource(
      name: 'changes_to_eyfs',
      link_to_text: 'Changes to the early years foundation stage framework',
      link_to: '#',
      body: 'Important information about the most recent changes to the EYFS framework.',
    )

    r4 = create_resource(
      name: 'development_matters',
      link_to_text: 'Development matters',
      link_to: '#',
      body: 'Non-statutory curriculum guidance for the early years foundation stage.',
    )

    r5 = create_resource(
      name: 'guidance_on_completing_progress_check',
      link_to_text: 'Guidance on completing the EYFS progress check at age 2',
      link_to: '#',
      body: 'Guidance to provide support for early years practitioners when completing the early years foundation stage (EYFS) progress check at age 2.',
    )

    create_resource(
      name: 'other_useful_resources',
      title: 'Other early years resources from the Department for Education',
      body: 'The Department for Education also provides the following free websites and resources to support people working in the early years.',
      resources: [r1, r2, r3, r4, r5],
    )
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
  def create_page(page, sub_entries = [], style = 'default')
    params = {
      slug: page.slug,
      'heroTitle': page.children.any? ? 'Overview' : page.title,
      'heroDescription': page.description,
      title: page.title,
      introduction: page.intro,
      'contentList': page.content_list,
      body: page.markdown,
      'metaDescription': page.description,
      'pageStyle': style,
      pages: sub_entries,
    }
    create_new_page(params)
  end

  # @return [Contentful::Management::DynamicEntry[page]]
  def create_new_page(params)
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

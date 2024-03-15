require 'rails_helper'

RSpec.describe 'Default Page', type: :system do
  # TODO: put visit in a before block once running in headless mode
  
  it 'displays the correct title' do
    visit '/support-for-practitioners'
    expect(page).to have_css('h1', text: 'Support for practitioners')
  end

  it 'displays the correct introductory text' do
    visit '/support-for-practitioners'
    expect(page).to have_text('Discover helpful resources and articles to help support you within your career and your setting.')
  end

  it 'displays the correct links' do
    visit '/support-for-practitioners'
    expect(page).to have_link('Reducing paperwork', href: '/support-for-practitioners/reducing-paperwork')
    expect(page).to have_link('Working in partnership with parents and carers', href: '/support-for-practitioners/working-in-partnership-with-parents-and-carers')
    expect(page).to have_link('Curriculum planning', href: '/support-for-practitioners/curriculum-planning')
    expect(page).to have_link('Early years practitioner wellbeing support', href: '/support-for-practitioners/early-years-practitioner-wellbeing-support')
    expect(page).to have_link('Training, qualifications, support and guidance', href: '/support-for-practitioners/training-qualifications-support-and-guidance-')
    expect(page).to have_link('Integrated reviews', href: '/support-for-practitioners/integrated-reviews')
    expect(page).to have_link('Changes to the early years foundation stage (EYFS) framework: January 2024', href: '/support-for-practitioners/changes-to-the-early-years-foundation-stage-eyfs-framework-january-2024')
    expect(page).to have_link('Meeting the needs of all children', href: '/support-for-practitioners/meeting-the-needs-of-all-children')
    expect(page).to have_link('English as an additional language (EAL)', href: '/support-for-practitioners/english-as-an-additional-language-eal')
    expect(page).to have_link('Sensory food education', href: '/support-for-practitioners/sensory-food-education')
  end
end

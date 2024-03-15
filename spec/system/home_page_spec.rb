require 'rails_helper'

RSpec.describe 'Early Years Providers Page', type: :system do
  # TODO: put visit in a before block once running in headless mode

  it 'displays the correct title' do
    visit '/'
    expect(page).to have_title('Help for early years providers')
  end

  it 'displays the correct text' do
    visit '/'
    expect(page).to have_css('h1', text: 'Help for early years providers')
    expect(page).to have_css('h2', text: 'Get help for your setting')
    expect(page).to have_text('Guidance for people who work in early years, from the Department for Education. This site provides resources, activities and support articles for childminders and practitioners working with children in the early years.')
    expect(page).to have_text('Find helpful articles and resources to support you in your setting.')
  end

  it 'displays the correct links' do
    visit '/'
    expect(page).to have_link('Support for practitioners', href: '/support-for-practitioners')
    expect(page).to have_link('Areas of learning', href: '/areas-of-learning')
    expect(page).to have_link('Health and wellbeing', href: '/health-and-wellbeing')
  end

  it 'displays the email alerts section' do
    visit '/'
    expect(page).to have_css('h3', text: 'Get email alerts for new EYFS resources')
    expect(page).to have_text('Receive email notifications when new early years foundation stage resources are added to this website.')
    expect(page).to have_link('Sign up for email alerts (opens in new tab)', href: 'https://forms.office.com.mcas.ms/Pages/ResponsePage.aspx?id=yXfS-grGoU2187O4s0qC-a1INvUBHVZElO6Xg1Rw2V9UQlg3SlFPTVZIRlFaVDY5MzJQQUxQTk0yQyQlQCN0PWcu')
  end

  it 'displays the website improvement section' do
    visit '/'
    expect(page).to have_css('h3', text: 'Help to improve this website')
    expect(page).to have_text('Provide us with your feedback to help us improve this website for people who work in the early years.')
    expect(page).to have_link('Complete the simple feedback form', href: 'https://forms.office.com/Pages/ResponsePage.aspx?id=yXfS-grGoU2187O4s0qC-a1INvUBHVZElO6Xg1Rw2V9UM1pQNEtCN0YyVVdFVkpOUVNXNUlZNTdOUCQlQCN0PWcu')
  end
end

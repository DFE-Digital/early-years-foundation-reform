require "rails_helper"

RSpec.feature "Feedback", type: :feature do
  before do
    skip 'WIP' if Rails.application.cms?
  end

  scenario "Page with feedback options" do
    visit "/"

    expect(page).to have_text("Is this page useful?")
    expect(page).to be_axe_clean
  end

  scenario "User gives positive feedback" do
    visit "/"

    within "#feedback" do
      page.click_button("Yes")
    end
    expect(page).not_to have_text("Is this page useful?")
    expect(page).to have_text("Thank you for your feedback")
    expect(page).to be_axe_clean
  end

  scenario "User gives negative feedback and closes dialogue" do
    visit "/"

    within "#feedback" do
      page.click_button("No")
    end
    expect(page).not_to have_text("Is this page useful?")
    expect(page).to have_text("Help us improve Help for early years providers")
    expect(page).to be_axe_clean

    within "#feedback" do
      page.click_button("Close")
    end

    expect(page).to have_text("Is this page useful?")
  end
end

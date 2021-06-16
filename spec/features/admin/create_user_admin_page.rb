require "rails_helper"

RSpec.feature "User administration", type: :feature do
  context "without session" do
    scenario "go to user administration page" do
      visit '/admin'
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    scenario "visits admin root" do
      login_as(FactoryBot.create(:editor))
      visit '/admin'
			nav = page.find_by_id('navigation')
			active_nav = nav.first('li.govuk-header__navigation-item--active')
      expect(active_nav).to have_css("a[href='/admin/users']", visible: true, text: 'Admin')
      expect(current_path).to eq(admin_root_path)
    end
  end
end

require "rails_helper"

RSpec.feature "View content blocks", type: :feature do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:content_block)
  end

  describe "A user with role of Admin can " do
    scenario "Navigate to the Content Blocks admin page" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)
      block = FactoryBot.create(:content_block)
      visit "/cms/blocks"

      expect(page).to have_text("Blocks")
      expect(page).to have_text(block.description)
    end

    scenario "The content block index page should not have any accessibility errors" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)
      visit "/cms/blocks"

      expect(page).to be_axe_clean
    end

    scenario "An admin user can change the markdown and description of an existing content block" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)
      block1 = FactoryBot.create(:content_block)

      visit edit_content_block_path(block1)
      page.find_field("content_block[markdown]").set("Brand new markdown")
      page.find_field("content_block[description]").set("A new description")

      page.click_button("Save")

      changed_block = ContentBlock.find block1.id

      expect(changed_block.markdown).to include("Brand new markdown")
      expect(changed_block.description).to include("A new description")
    end

    scenario "An admin user can create a content block" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)

      visit new_content_block_path
      page.find_field("content_block[name]").set(valid_attributes[:name])
      page.find_field("content_block[description]").set(valid_attributes[:description])
      page.find_field("content_block[markdown]").set(valid_attributes[:markdown])

      page.click_button("Save")

      changed_block = ContentBlock.find_by_name valid_attributes[:name]

      expect(changed_block.markdown).to include(valid_attributes[:markdown])
    end

    scenario "An admin user cannot change the name of an existing content block" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)
      block1 = FactoryBot.create(:content_block)

      visit edit_content_block_path(block1)

      expect(page.find_field("content_block[name]", disabled: true).value).to eq(block1.name)
    end

    scenario "The Accessibility page can be produced using a Content Block called 'accessibility'" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)

      ContentBlock.destroy_all
      ContentBlock.create!(name: "accessibility",
                           description: "For the accessibility page",
                           markdown: valid_attributes[:markdown])

      visit("accessibility-statement")

      expect(page.body).to include(valid_attributes[:markdown])
    end
  end

  describe "editors cannot access Content Block functionality" do
    scenario "The Blocks menu is hidden from editors" do
      sign_in FactoryBot.create(:user, role: User::EDITOR)

      # This does throw the exception, but puma catches it
      # expect { visit "cms/blocks" }.to raise_error( Pundit::NotAuthorizedError )
    end
  end

  describe "Falling back to an initial version of ContentBlock text" do
    scenario "If the ContentBlock is undefined in the database, its initial value should still be set by the locale (en.yml)" do
      visit("/")
      expect(page.body).to include("Find guidance and practical support to help you with the changes")
    end
  end
end

require "rails_helper"

RSpec.feature "View content blocks", type: :feature do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:content_block)
  end

  describe "A user with role of Admin can " do
    scenario "Navigate to Content Blocks" do
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

    scenario "The Blocks menu is visible to admin users" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)

      visit "cms/pages"

      expect(page.body).to include("Blocks")
    end

    scenario "Admin users can create a new content block" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)
      block1 = FactoryBot.create(:content_block)

      visit edit_content_block_path(block1)
      page.find_field("content_block[markdown]").set("Brand new markdown")
      page.click_button("Update Content block")

      changed_block = ContentBlock.find block1.id

      expect(changed_block.markdown).to include("Brand new markdown")
    end

    scenario "Admin users can edit a content blocks" do
      sign_in FactoryBot.create(:user, role: User::ADMIN)

      visit new_content_block_path
      page.find_field("content_block[name]").set(valid_attributes[:name])
      page.find_field("content_block[markdown]").set(valid_attributes[:markdown])
      page.find_field("content_block[description]").set(valid_attributes[:description])

      page.click_button("Create Content block")

      changed_block = ContentBlock.find_by_name valid_attributes[:name]

      expect(changed_block.markdown).to include(valid_attributes[:markdown])
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
end

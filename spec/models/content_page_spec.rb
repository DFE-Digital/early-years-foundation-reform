require "rails_helper"

RSpec.describe ContentPage, type: :model do
  let(:expected_exception_message) do
    /#{ContentPage::TITLE_FORMAT_ERROR_MESSAGE}/
  end

  it "only allows alphanumeric and spaces in the title" do
    attributes_for_page = FactoryBot.attributes_for(:content_page, :with_special_chars_in_title)

    page = ContentPage.new(attributes_for_page)
    expect { page.save! }.to raise_exception(expected_exception_message)
  end

  it "sets the slug from the title, converting spaces to hyphens" do
    page = FactoryBot.create(:content_page)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, removing commas" do
    page = FactoryBot.create(:content_page, :comma_in_title)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, removing round braces" do
    page = FactoryBot.create(:content_page, :round_braces_in_title)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, removing colons" do
    page = FactoryBot.create(:content_page, :colon_in_title)

    expect { page.save! }.to_not raise_error

    saved_page = ContentPage.find_by_title page.title
    expect(saved_page.slug.count(":")).to be(0)
    expect(saved_page.title.count(":")).to be(1)
  end

  it "sets the slug from the title, preserving hyphens" do
    page = FactoryBot.create(:content_page, :two_hyphens_and_a_space_in_title)

    expect { page.save! }.to_not raise_error

    saved_page = ContentPage.find_by_title page.title
    expect(saved_page.slug.count("-")).to be(3)
    expect(saved_page.title.count("-")).to be(2)
  end

  it "Generates the correct full path for a top level ContentPage" do
    parent = FactoryBot.create(:content_page)

    expect(parent.full_path).to eq(parent.slug)
  end

  it "Generates the correct full path for a child ContentPage" do
    parent = FactoryBot.create(:content_page)
    child = FactoryBot.create(:content_page, parent_id: parent.id)

    expect(child.full_path).to eq("/" + parent.slug + "/" + child.slug)
  end

  # The order is a depth first search
  context "Next and Previous pages" do
    before(:each) do
      ContentPage.destroy_all # Otherwise the pages created above spoil this test

      @top_level1 = FactoryBot.create(:content_page, position: 1)
      @top_level2 = FactoryBot.create(:content_page, position: 10)

      @child1_of_top_level1 = FactoryBot.create(:content_page, position: 1, parent_id: @top_level1.id)
      @child2_of_top_level1 = FactoryBot.create(:content_page, position: 2, parent_id: @top_level1.id)

      @child1_of_top_level2 = FactoryBot.create(:content_page, position: 1, parent_id: @top_level2.id)
      @child2_of_top_level2 = FactoryBot.create(:content_page, position: 2, parent_id: @top_level2.id)

      # The reordering happens after_create, so need to refetch these
      # to get their updated next/previous state
      @top_level1 = ContentPage.find @top_level1.id
      @top_level2 = ContentPage.find @top_level2.id
      @child1_of_top_level1 = ContentPage.find @child1_of_top_level1.id
      @child2_of_top_level1 = ContentPage.find @child2_of_top_level1.id
      @child1_of_top_level2 = ContentPage.find @child1_of_top_level2.id
      @child2_of_top_level2 = ContentPage.find @child2_of_top_level2.id
    end

    context "Navigating to the Next page" do
      it "The next_page should return the first child page when called on a parent" do
        expect(@top_level1.next_page).to eq(@child1_of_top_level1)
      end

      it "The next_page should return the parents next sibling when called on the last child page" do
        expect(@child2_of_top_level1.next_page).to eq(@top_level2)
      end

      it "The next_page should return the first page when called with the last page (loop around)" do
        expect(@child2_of_top_level2.next_page).to eq(@top_level1)
      end
    end

    context "Navigating to the Previous page" do
      it "The previous_page should return the last child of the second parent when called on a first parent" do
        expect(@top_level1.previous_page).to eq(@child2_of_top_level2)
      end

      it "The previous_page should return the previous sibling of a child if a sibling exists" do
        expect(@child2_of_top_level1.previous_page).to eq(@child1_of_top_level1)
      end

      it "The previous_page of a first child should return the parent" do
        expect(@child1_of_top_level2.previous_page).to eq(@top_level2)
      end

      it "Should reorder the pages when a page is changed" do
        @page_in_the_middle = FactoryBot.create(:content_page, position: 5)
        # The reordering happens after_create, so need to refetch these
        @page_in_the_middle = ContentPage.find @page_in_the_middle.id
        @child2_of_top_level1 = ContentPage.find @child2_of_top_level1.id
        expect(@child2_of_top_level1.next_page).to eq(@page_in_the_middle)
      end
    end
  end
end

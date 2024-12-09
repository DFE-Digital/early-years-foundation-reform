require 'rails_helper'

RSpec.describe 'First/Second/Third tier pages' do
  describe 'First tier page' do
    before do
      visit '/areas-of-learning'
    end

    it 'has a heading' do
      within '#hero-layout' do
        expect(page).to have_text('Areas of learning')
      end
    end

    it 'has a body' do
      within '#hero-layout' do
        expect(page.body).to be_present
      end
    end

    it 'has a call to action component' do
      within '.hf-ctas' do
        expect(page).to have_text('Help to improve this website')
      end
    end

    it 'has other resources' do
      within '.hf-other' do
        expect(page).to have_text('Other early years resources from the Department for Education')
      end
    end
  end

  describe 'Second tier page' do
    before do
      visit '/areas-of-learning/communication-and-language'
    end

    it 'has a heading' do
      expect(page).to have_text('Overview')
    end

    it 'has a body' do
      expect(page.body).to be_present
    end

    it 'has a call to action component' do
      within '.hf-ctas' do
        expect(page).to have_text('Help to improve this website')
      end
    end

    it 'has content footer component' do
      within '.cta-banner' do
        expect(page).to have_text('Early years child development training')
      end
    end
  end

  describe 'Third tier page' do
    before do
      visit '/areas-of-learning/communication-and-language/interactions'
    end

    it 'has a page title' do
      expect(page.title).to eq('Help for early years providers : Interactions')
    end

    it 'has a contents list' do
      within '.contents-on-page' do
        expect(page).to have_text('Contents on this page')
      end
    end

    it 'has a print this page button' do
      expect(page).to have_text('Print this page')
    end

    it 'has a body' do
      expect(page.body).to be_present
    end

    it 'renders h2 as govuk-heading-m' do
      within '#why-interactions-are-important' do
        expect(page.body).to include 'govuk-heading-m'
      end
    end

    it 'has a back to top button' do
      expect(page).to have_text('Back to top')
    end

    it 'has a call to action component' do
      within '.hf-ctas' do
        expect(page).to have_text('Help to improve this website')
      end
    end

    it 'has content footer component' do
      within '.cta-banner' do
        expect(page).to have_text('Early years child development training')
      end
    end
  end

  # describe 'First tier when route is in incorrect format' do
  #   before do
  #     visit '/randompage.yml'
  #   end

  #   it 'has a heading' do
  #     expect(page).to have_text('Page not found')
  #   end
  # end

  # describe 'Second tier when route is in incorrect format' do
  #   before do
  #     visit '/route/randompage.yml'
  #   end

  #   it 'has a heading' do
  #     expect(page).to have_text('Page not found')
  #   end
  # end

  # describe 'Third tier when route is in incorrect format' do
  #   before do
  #     visit '/route/route/randompage.yml'
  #   end

  #   it 'has a heading' do
  #     expect(page).to have_text('Page not found')
  #   end
  # end
end

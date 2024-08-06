RSpec.describe 'Card heading levels based on tier' do
  describe 'Homepage renders h3 for tier1 card' do
    before do
      visit '/homepage'
    end

    it 'renders h3 for tier1 card' do
      all('.hf-card-details').each do |card|
        within card do
          expect(page).to have_css('h3.govuk-heading-m', text: 'Card Title')
          expect(page).not_to have_css('h2.govuk-heading-m')
        end
      end
    end
  end

  describe 'Section page renders h2 for tier2 card' do
    before do
      visit '/section-page'
    end

    it 'renders h2 for tier2 card' do
      all('.hf-card-details').each do |card|
        within card do
          expect(page).to have_css('h2.govuk-heading-m', text: 'Card Title')
          expect(page).not_to have_css('h3.govuk-heading-m')
        end
      end
    end
  end
end

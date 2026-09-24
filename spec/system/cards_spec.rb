RSpec.describe 'Card heading levels based on tier' do
  describe 'Homepage renders h3 for tier1 card' do
    before do
      visit '/'
    end

    it 'renders h3 for tier1 card' do
      all('.dfe-card-container').each do |card|
        within card do
          expect(page).to have_css('h3.govuk-heading-m')
          expect(page).not_to have_css('h2.govuk-heading-m')
        end
      end
    end
  end

  describe 'Section page renders h2 for tier2 card' do
    before do
      visit '/areas-of-learning'
    end

    it 'renders h2 for tier2 card' do
      all('.dfe-card-container').each do |card|
        within card do
          expect(page).to have_css('h2.govuk-heading-m')
          expect(page).not_to have_css('h3.govuk-heading-m')
        end
      end
    end
  end
end

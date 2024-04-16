require 'rails_helper'

describe 'ContentHelper', type: :helper do
  describe '#m' do
    subject(:html) { helper.m(input) }

    context 'with plain text' do
      let(:input) { 'text' }

      it 'returns text within p tags' do
        expect(html).to eq '<p class="govuk-body-m">text</p>'
      end
    end

    context 'with markdown' do
      let(:input) { '## text' }

      it 'translates markdown' do
        expect(html).to eq '<h2 id="text" class="govuk-heading-m">text</h2>'
      end
    end

    context 'with custom markup' do
      describe 'button' do
        let(:input) { '{button}[text](/link){/button}' }

        it 'creates a button link' do
          expect(html).to eq <<~HTML.strip
            <p class="govuk-body-m"><a href="/link" class="govuk-link govuk-button">
            text
            </a></p>
          HTML
        end
      end

      describe 'external' do
        let(:input) { '{external}[text](https://forms.external.com/foo.aspx?id=xxx){/external}' }

        it 'creates an external link' do
          expect(html).to eq <<~HTML.strip
            <p class="govuk-body-m"><a href="https://forms.external.com/foo.aspx?id=xxx" class="govuk-link" target="_blank" rel="noopener noreferrer">
            text (opens in a new tab)
            </a></p>
          HTML
        end
      end

      describe 'Big quote prompt' do
        let(:input) do
          <<~MARKUP
            {quote}
            Life is trying things to see if they work.

            Ray Bradbury
            {/quote}
          MARKUP
        end

        it 'builds semantic markup' do
          expect(html).to eq '<div class="blockquote-container"><blockquote class="quote"><p class="govuk-body-m">Life is trying things to see if they work.</p><cite>Ray Bradbury</cite></blockquote></div>'
        end
      end

      describe 'Row templates' do
        let(:input) do
          <<~MARKUP
            {two_thirds}
            Description of an image

            ![image title](/path/to/image)
            {/two_thirds}
          MARKUP
        end

        it 'builds semantic markup' do
          expect(html).to eq '<div class="govuk-grid-row"><div class="govuk-grid-column-two-thirds"><p class="govuk-body-m">Description of an image</p></div><div class="govuk-grid-column-one-third"><p class="govuk-body-m"><img src="/path/to/image" alt="image title"></p></div></div>'
        end
      end
    end
  end
end

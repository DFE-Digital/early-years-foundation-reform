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

  describe 'Not found error' do
    subject(:not_found_resource) { helper.not_found }

    context 'with plain text' do
      it 'returns text for not found' do
        expect(not_found_resource.title).to eq 'Page not found'
      end
    end
  end

  describe 'Internal server error' do
    subject(:internal_server_resource) { helper.internal_server_error }

    context 'with plain text' do
      it 'returns text for internal server error' do
        expect(internal_server_resource.title).to eq 'Sorry, there is a problem with the website'
      end
    end
  end

  describe 'Unprocessable entity error' do
    subject(:unprocessable_entity_resource) { helper.unprocessable_entity }

    context 'with plain text' do
      it 'returns text for unprocessible entity error' do
        expect(unprocessable_entity_resource.title).to eq 'The change you wanted was rejected'
      end
    end
  end

  describe 'Service unavailable error' do
    subject(:service_unavailable_resource) { helper.service_unavailable }

    context 'with plain text' do
      it 'returns text for service unavailable' do
        expect(service_unavailable_resource.title).to eq 'Sorry, the site is unavailable'
      end
    end
  end

  describe '#placeholder_resource' do
    subject(:placeholder_resource) { helper.placeholder_resource('example') }

    context 'with name passed in' do
      it 'returns content using name' do
        expect(placeholder_resource.title).to eq 'Title for example'
      end
    end
  end

  describe '#card_thumbnail' do
    let(:page) { Page.by_slug(slug) }

    context 'with image' do
      let(:slug) { 'reducing-paperwork' }

      it do
        expect(helper.card_thumbnail(page)).to include 'images.ctfassets'
      end
    end

    context 'with placeholder' do
      let(:slug) { 'interactions' }

      it do
        expect(helper.card_thumbnail(page)).to include 'https://placehold.co'
      end
    end
  end

  describe '#placeholder_thumbnail' do
    it do
      expect(helper.placeholder_thumbnail).to be_a OpenStruct
      expect(helper.placeholder_thumbnail.url).to eql 'https://placehold.co/380x254/347ca9/FFFFFF/png'
    end
  end
end

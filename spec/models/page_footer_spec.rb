require 'rails_helper'

RSpec.describe Page, '.footer', type: :model do
  subject(:page) { described_class.footer }

  specify { expect(page).to be_a described_class }

  describe '#children' do
    specify { expect(page.children.count).to eq 5 }
  end
end

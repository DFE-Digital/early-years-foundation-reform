require 'rails_helper'

RSpec.describe Page, '.home', type: :model do
  subject(:page) { described_class.home }

  specify { expect(page).to be_a described_class }

  describe '#children' do
    specify { expect(page.children.count).to eq 3 }
  end
end

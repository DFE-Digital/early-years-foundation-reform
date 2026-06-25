require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe '.by_name' do
    before { described_class.cache.clear }
    after { described_class.cache.clear }

    specify do
      expect(described_class.by_name('error.not_found')).to be_a described_class
    end

    it 'does not cache nil results' do
      contentful_resource = instance_double(described_class)

      allow(described_class).to receive(:find_by)
        .with(name: 'error.not_found')
        .and_return([], [contentful_resource])

      expect(described_class.by_name('error.not_found')).to be_nil
      expect(described_class.by_name('error.not_found')).to eq contentful_resource
      expect(described_class).to have_received(:find_by).twice
    end
  end
end

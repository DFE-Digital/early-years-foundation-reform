require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe '.by_name' do
    specify do
      expect(described_class.by_name('error.not_found')).to be_a described_class
    end
  end
end

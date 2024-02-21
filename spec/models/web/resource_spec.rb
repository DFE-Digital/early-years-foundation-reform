require 'rails_helper'

RSpec.describe Web::Resource, type: :model do
  before { skip 'WIP' unless Rails.application.cms? }

  describe '.by_name' do
    specify do
      expect(described_class.by_name('test.resource')).to be_a described_class
    end
  end

  describe '.ordered' do
    specify do
      expect(described_class.ordered.map(&:name)).to include('home.hero.body')
    end
  end
end

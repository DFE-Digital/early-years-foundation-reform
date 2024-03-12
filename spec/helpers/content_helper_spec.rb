require 'rails_helper'

RSpec.describe ContentHelper, type: :helper do
  xdescribe 'paths for content' do
    it 'returns the correct path for a top level page' do
      expect(path_for_this_page(child.parent)).to eq("/#{child.parent.slug}")
    end

    it 'returns the correct path for a child level page' do
      expect(path_for_this_page(child)).to eq("/#{child.parent.slug}/#{child.slug}")
    end
  end
end

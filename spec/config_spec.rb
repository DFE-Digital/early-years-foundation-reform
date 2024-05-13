require 'rails_helper'

RSpec.describe 'Application configuration' do
  subject(:config) { GovukRailsBoilerplate::Application.config }

  it 'tests against demo content' do
    expect(ContentfulRails.configuration.environment).to eq 'master'
    expect(config.contentful_environment).to eq 'master'
  end
end

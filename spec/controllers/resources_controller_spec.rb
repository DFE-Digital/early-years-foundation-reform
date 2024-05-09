require 'rails_helper'

RSpec.describe ResourcesController, type: :request do
  before do
    get resource_path(resource)
  end

  context 'when resource exists' do
    let(:resource) { 'ctas.feedback' }

    specify { expect(response).to have_http_status(:success) }
  end
end

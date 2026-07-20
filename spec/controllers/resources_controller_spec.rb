require 'rails_helper'

RSpec.describe ResourcesController, type: :request do
  context 'when resource exists' do
    let(:resource) { 'ctas.feedback' }

    before do
      allow(Resource).to receive(:by_name).with(resource).and_return(OpenStruct.new(body: 'Preview **content**'))

      get resource_path(resource)
    end

    specify 'returns success' do
      expect(response).to have_http_status(:success)
      expect(response.body).to include('<strong>content</strong>')
    end
  end

  context 'when resource does not exist' do
    let(:resource) { 'missing.resource' }

    before do
      allow(Resource).to receive(:by_name).with(resource).and_return(nil)

      get resource_path(resource)
    end

    specify { expect(response).to have_http_status(:not_found) }
  end

  context 'when resource name contains an XSS payload' do
    let(:resource) { '<img src=x onerror=alert(1)>' }

    before do
      allow(Resource).to receive(:by_name).with(resource).and_return(nil)

      get resource_path(resource)
    end

    specify 'returns not found and does not reflect the payload' do
      expect(response).to have_http_status(:not_found)
      expect(response.body).not_to include('<img src=x onerror=alert(1)>')
      expect(response.body).not_to include('onerror=alert(1)')
    end
  end
end

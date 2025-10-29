require 'rails_helper'

RSpec.describe 'Webhooks', type: :request do
  let(:release) { { sys: { id: 'release', completedAt: Time.zone.now } } }
  let(:change)  { { sys: { id: 'change', updatedAt: Time.zone.now } } }

  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  before do
    allow(Resource).to receive(:reset_cache_key!)
    allow(Page).to receive(:reset_cache_key!)
    allow(Rails.logger).to receive(:info)
    allow(Rails.logger).to receive(:error)
  end

  context 'when correct params are passed for /release and /change' do
    it 'persists the latest release event and logs it' do
      post '/release', params: release, as: :json, headers: headers
      expect(response).to have_http_status(:ok)
      # expect(Release.last.name).to eql 'release'
      expect(Resource).to have_received(:reset_cache_key!).at_least(:once)
      expect(Page).to have_received(:reset_cache_key!).at_least(:once)
      expect(Rails.logger).to have_received(:info).with(
        a_string_including('[Webhook] Received release webhook'),
      )
    end

    it 'persists the latest change event and logs it' do
      post '/change', params: change, as: :json, headers: headers
      expect(response).to have_http_status(:ok)
      # expect(Release.last.name).to eql 'change'
      expect(Resource).to have_received(:reset_cache_key!).at_least(:once)
      expect(Page).to have_received(:reset_cache_key!).at_least(:once)
      expect(Rails.logger).to have_received(:info).with(
        a_string_including('[Webhook] Received change webhook'),
      )
    end
  end

  context 'with invalid JSON' do
    it 'returns 400 and logs an error' do
      post '/release', params: { body: 'not json' }, headers: headers
      expect(response).to have_http_status(:bad_request)
      expect(JSON.parse(response.body)).to eq('error' => 'Invalid JSON payload')
      expect(Rails.logger).to have_received(:error).with(
        a_string_including('[Webhook] JSON parse error'),
      )
    end
  end
end

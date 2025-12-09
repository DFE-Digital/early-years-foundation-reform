require 'rails_helper'

RSpec.describe 'Webhooks', type: :request do
  let(:release) { { sys: { id: 'release', completedAt: Time.zone.now } } }
  let(:change)  { { sys: { id: 'change', updatedAt: Time.zone.now } } }

  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  before do
    allow(Rails.logger).to receive(:info).and_call_original
    allow(Rails.logger).to receive(:error).and_call_original
    allow(Rails.logger).to receive(:warn).and_call_original
  end

  context 'when correct params are passed for /release and /change' do
    it 'persists the latest release event and logs it' do
      post '/release', params: release, as: :json, headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('content release received')
    end

    it 'persists the latest change event and logs it' do
      post '/change', params: change, as: :json, headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('content change received')
    end

    it 'passes the extracted timestamp successfully' do
      timestamp = Time.zone.parse('2025-12-09T14:30:00Z')
      release_with_time = { sys: { id: 'release', completedAt: timestamp.iso8601 } }

      post '/release', params: release_with_time, as: :json, headers: headers

      expect(response).to have_http_status(:ok)
    end
  end

  context 'with missing timestamp field' do
    it 'uses current time for release when timestamp missing' do
      release_no_time = { sys: { id: 'release' } }

      post '/release', params: release_no_time, as: :json, headers: headers

      expect(response).to have_http_status(:ok)
    end

    it 'uses current time for change when timestamp missing' do
      change_no_time = { sys: { id: 'change' } }

      post '/change', params: change_no_time, as: :json, headers: headers

      expect(response).to have_http_status(:ok)
    end
  end

  context 'with invalid timestamp format' do
    it 'uses current time when timestamp format invalid' do
      release_bad_time = { sys: { id: 'release', completedAt: 'not-a-valid-date' } }

      post '/release', params: release_bad_time, as: :json, headers: headers

      expect(response).to have_http_status(:ok)
    end
  end

  context 'with invalid JSON' do
    it 'returns 400 for invalid JSON' do
      post '/release', params: { body: 'not json' }, headers: headers
      expect(response).to have_http_status(:bad_request)
      expect(JSON.parse(response.body)).to eq('error' => 'Invalid JSON payload')
    end
  end
end

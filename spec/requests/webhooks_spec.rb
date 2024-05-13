require 'rails_helper'

# The hook controller has the same logic as CDT
RSpec.describe 'Webhooks', type: :request do
  let(:release) do
    { sys: { id: 'release', completedAt: Time.zone.now } }
  end

  let(:change) do
    { sys: { id: 'change', updatedAt: Time.zone.now } }
  end

  context 'when correct params are passed for /release and /change' do
    describe 'POST /release' do
      it 'persists the latest release event' do
        expect(Release.count).to be 0
        post '/release', params: release, as: :json, headers: headers
        expect(response).to have_http_status(:ok)
        expect(Release.last.name).to eql 'release'
      end
    end

    describe 'POST /change' do
      it 'persists the latest change event' do
        expect(Release.count).to be 0
        post '/change', params: change, as: :json, headers: headers
        expect(response).to have_http_status(:ok)
        expect(Release.last.name).to eql 'change'
      end
    end
  end
end

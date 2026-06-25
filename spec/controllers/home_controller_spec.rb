require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET /' do
    before do
      Page.cache.clear
      Resource.cache.clear
    end

    after do
      Page.cache.clear
      Resource.cache.clear
    end

    it 'returns service unavailable when the home page cannot be loaded' do
      allow(Page).to receive_messages(home: nil, footer: nil)
      allow(Resource).to receive(:by_name).and_return(nil)

      get '/'

      expect(response).to have_http_status(:service_unavailable)
    end
  end
end

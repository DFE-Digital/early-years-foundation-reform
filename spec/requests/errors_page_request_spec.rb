require 'rails_helper'

RSpec.describe '/404', type: :request do
  describe 'GET /404' do
    it 'renders the not found page' do
      get '/404'
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('Page not found')
    end
  end
end

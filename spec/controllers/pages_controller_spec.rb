require 'rails_helper'

RSpec.describe PagesController, type: :request do
  describe 'when an incorrect url is used' do
    it 'shows the page not found content' do
      get '/incorrect-url'
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include 'Page not found'
    end
  end

  describe 'when an incorrect url is used in an incorrect format' do
    it 'returns the page not found content with a 404' do
      get '/incorrect-url.css'
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include 'Page not found'
    end

    it 'returns the page not found content with a 404 for apple touch icon requests' do
      get '/apple-touch-icon-152x152-precomposed.png'
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include 'Page not found'
    end
  end
end

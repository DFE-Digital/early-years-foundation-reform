require 'rails_helper'

RSpec.describe PagesController, type: :request do
  describe 'when an incorrect url is used' do
    it 'shows the page not found content' do
      get '/incorrect-url'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'Page not found'
    end
  end
end

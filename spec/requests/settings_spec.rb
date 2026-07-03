require 'rails_helper'

RSpec.describe 'Settings', type: :request do
  describe 'POST /settings' do
    it 'redirects to a valid internal path from return_url' do
      post '/settings', params: { track_analytics: 'Yes', return_url: '/cookie-policy' }

      expect(response).to redirect_to('/cookie-policy')
    end

    it 'falls back to root for an unsafe external return_url' do
      post '/settings', params: {
        track_analytics: 'Yes',
        return_url: 'https://help-for-early-years-providers.education.gov.ukevil.com',
      }

      expect(response).to redirect_to(root_path)
    end
  end
end
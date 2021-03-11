require "rails_helper"

RSpec.describe "/content_pages", type: :request do

  sign_in create(:user, name: 'John Doe')
  visit root_path
  expect(page).to include('John Doe')

end

require "rails_helper"

RSpec.describe User, type: :model do
  specify { expect(FactoryBot.create(:user)).to be_valid }
end

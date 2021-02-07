require "rails_helper"

RSpec.describe ContentController, type: :controller do
  # rubocop:disable Lint/AmbiguousBlockAssociation
  # Disable this cop, since it's a deliberate idiom in RSpec.
  # Note trying (:top_level_page) results in a different rubocop OCDism ie
  # Lint/ParenthesesAsGroupedExpression: (...) interpreted as grouped expression.
  let top_level_page { FactoryBot.create(:content_page, :top_level) }
  # rubocop:enable Lint/AmbiguousBlockAssociation
  describe "GET a top level page" do
    it "returns a top level page" do
      get "/content/" + top_level_page.slug
      expect(response).to have_http_status(200)
    end
  end
end

require "rails_helper"

RSpec.describe "Sort a list of articles", type: :feature do
  let!(:article_1) { create :article, :published, published_at: 1.minute.ago, description: "Support article" }
  let!(:article_2) { create :article, :published, published_at: 2.minutes.ago, description: "A typical support article" }
  let!(:article_3) { create :article, :published, published_at: 3.minutes.ago, description: "Beware a description of another support article" }
  before { login_as(create(:editor)) }

  context "with no sorting paramaters specified" do
    it "sorts articles in alphabetical order" do
      visit "/admin/articles"
      expected_article_order = [article_2, article_3, article_1].map(&:description)
      elements = find_all("tr.article td:first-child").map(&:text)
      expect(elements).to eq expected_article_order
    end
  end

  context "with published date selected" do
    it "sorts articles in published order" do
      visit "/admin/articles?sort=published_at"
      expected_article_order = [article_3, article_2, article_1].map(&:description)
      elements = find_all("tr.article td:first-child").map(&:text)
      expect(elements).to eq expected_article_order
    end
  end

  context "with created date selected" do
    it "sorts articles in created at order" do
      visit "/admin/articles?sort=created_at#draft"
      expected_article_order = [article_1, article_2, article_3].map(&:description)
      elements = find_all("tr.article td:first-child").map(&:text)
      expect(elements).to eq expected_article_order
    end
  end

  context "with unpublished date selected" do
    it "sorts articles in unpublished order" do
      article_2.unpublished!
      article_3.unpublished!
      article_1.unpublished!
      visit "admin/articles?sort=unpublished_at#unpublished"
      expected_article_order = [article_2, article_3, article_1].map(&:description)
      elements = find_all("tr.article td:first-child").map(&:text)
      expect(elements).to eq expected_article_order
    end
  end
end

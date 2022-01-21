require "rails_helper"

RSpec.describe "Admin::ArticlesController#index sorting", type: :request do
  let!(:article_1) { create :complete_article, :published, published_at: 1.minute.ago, description: "Support article" }
  let!(:article_2) { create :complete_article, :published, published_at: 2.minutes.ago, description: "A typical support article" }
  let!(:article_3) { create :complete_article, :published, published_at: 3.minutes.ago, description: "Beware a support article" }

  before { login_as(create(:editor)) }

  context "with no sorting paramaters specified" do
    it "sorts articles in alphabetical order" do
      get admin_articles_path
      expected_article_order = [article_2, article_3, article_1].map(&:description)
      elements = html_document.css(":not(.govuk-tabs__panel--hidden) tr.article td:first-child").map(&:text).map(&:strip)
      expect(elements).to eq expected_article_order
    end
  end

  context "with published date selected" do
    it "sorts articles in published order" do
      get admin_articles_path(sort: :published_at)
      expected_article_order = [article_3, article_2, article_1].map(&:description)
      elements = html_document.css("#published tr.article td:first-child").map(&:text).map(&:strip)
      expect(elements).to eq expected_article_order
    end
  end

  context "with draft articles and created date selected" do
    let!(:article_1) { create :complete_article, description: "Support article" }
    let!(:article_2) { create :complete_article, description: "A typical support article" }
    let!(:article_3) { create :complete_article, description: "Beware a support article" }
    it "sorts articles in created at order" do
      get admin_articles_path(sort: :created_at, anchor: :draft)
      expected_article_order = [article_1, article_2, article_3].map(&:description)
      elements = html_document.css("#draft tr.article td:first-child").map(&:text).map(&:strip)
      expect(elements).to eq expected_article_order
    end
  end

  context "with unpublished articles and unpublished date selected" do
    let!(:article_1) { create :complete_article, :unpublished, unpublished_at: 1.minute.ago, description: "Support article" }
    let!(:article_2) { create :complete_article, :unpublished, unpublished_at: 3.minutes.ago, description: "A typical support article" }
    let!(:article_3) { create :complete_article, :unpublished, unpublished_at: 2.minutes.ago, description: "Beware a support article" }
    it "sorts articles in unpublished order" do
      get admin_articles_path(sort: :unpublished_at, anchor: :unpublished)
      expected_article_order = [article_2, article_3, article_1].map(&:description)
      elements = html_document.css("#unpublished tr.article td:first-child").map(&:text).map(&:strip)
      expect(elements).to eq expected_article_order
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe FooterComponent, type: :component do
  let(:footer_meta) { "div.govuk-footer__meta" }
  let(:footer_navigation) { "div.govuk-footer__navigation" }

  context "with no items" do
    it "renders no navigation section" do
      expect(
        render_inline(described_class.new),
      ).not_to have_selector(footer_navigation)
    end

    it "renders the rest of the footer" do
      expect(
        render_inline(described_class.new),
      ).to have_selector(footer_meta)
    end
  end

  context "with one item" do
    before do
      render_inline(
        described_class.new(
          items: [
            { text: "First navigation item", href: "#" },
          ],
        ),
      )
    end

    context "when looking at the navigation list" do
      subject(:navigation_list) { page.find("#{footer_navigation} ul.govuk-footer__list") }

      it "renders one item" do
        expect(navigation_list).to have_selector("li.govuk-footer__list-item", count: 1)
        expect(navigation_list).to have_selector("li.govuk-footer__list-item:nth-child(1) a[href='#']", text: "First navigation item")
      end
    end
  end

  context "with multiple items" do
    before do
      render_inline(
        described_class.new(
          items: [
            { text: "First navigation item", href: "#" },
            { text: "Second navigation item", href: "#" },
          ],
        ),
      )
    end

    context "when looking at the navigation list" do
      subject(:navigation_list) { page.find("#{footer_navigation} ul.govuk-footer__list") }

      it "renders multiple items" do
        expect(navigation_list).to have_selector("li.govuk-footer__list-item", count: 2)
        expect(navigation_list).to have_selector("li.govuk-footer__list-item:nth-child(1) a[href='#']", text: "First navigation item")
        expect(navigation_list).to have_selector("li.govuk-footer__list-item:nth-child(2) a[href='#']", text: "Second navigation item")
      end
    end
  end
end

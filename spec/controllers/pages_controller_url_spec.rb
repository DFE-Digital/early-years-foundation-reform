require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views false

  describe 'GET #show' do
    let(:parent_path) { '/test-section/test-parent' }
    let(:child_path) { "#{parent_path}/test-child" }

    let(:child_page) do
      instance_double(Page, path: child_path, to_partial_path: 'side_nav')
    end

    let(:parent_page) do
      instance_double(Page, path: parent_path, to_partial_path: 'side_nav')
    end

    before do
      allow(Page).to receive(:by_slug)
        .with('test-child').and_return(child_page)

      allow(Page).to receive(:by_slug)
        .with('test-parent').and_return(parent_page)
    end

    it 'redirects a child URL missing its parent slug' do
      get :show, params: {
        section: 'test-section',
        slug: 'test-child',
      }

      expect(response).to have_http_status(:moved_permanently)
      expect(response).to redirect_to(child_path)
    end

    it 'redirects a child URL with an incorrect parent slug' do
      get :show, params: {
        section: 'test-section',
        overview: 'wrong-parent',
        slug: 'test-child',
      }

      expect(response).to have_http_status(:moved_permanently)
      expect(response).to redirect_to(child_path)
    end

    it 'redirects a child URL with an incorrect section' do
      get :show, params: {
        section: 'wrong-section',
        overview: 'test-parent',
        slug: 'test-child',
      }

      expect(response).to have_http_status(:moved_permanently)
      expect(response).to redirect_to(child_path)
    end

    it 'renders a child page at its full URL' do
      get :show, params: {
        section: 'test-section',
        overview: 'test-parent',
        slug: 'test-child',
      }

      expect(response).to have_http_status(:ok)
    end

    it 'renders a parent page at its two-segment URL' do
      get :show, params: {
        section: 'test-section',
        slug: 'test-parent',
      }

      expect(response).to have_http_status(:ok)
    end
  end
end

Rails.application.routes.draw do
  get "/check" => "application#check"

  # Note These have to be above the wildcard route
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
  get "/503", to: "errors#service_unavailable", via: :all

  resources :settings, only: %i[show create]

  constraints CmsRouteConstraint.new do
    devise_for :users
    devise_scope :user do
      get "sign_in", to: "devise/sessions#new"
      delete "sign_out", to: "devise/sessions#destroy"
    end

    namespace :admin do
      root to: "users#index"
      resources :users
      resources :articles do
        post "publish", on: :member
        post "unpublish", on: :member
      end
      resources :content_pages, path: "pages" do
        get "versions", on: :member
        get "preview_of_live", on: :member
        post "unpublish", on: :member
        resources :content_page_versions do
          get "preview_of_draft", on: :member
          post "publish", on: :member
        end
      end
      resources :content_blocks, path: "blocks", only: %i[index new edit create update]
      resources :content_assets, path: "assets"
      #  This is not a resource route
      post "preview_markdown", to: "content_pages#preview"
    end
  end

  %w[accessibility-statement contact-us disclaimer].each do |static_page|
    get "/#{static_page}", to: "static_pages##{static_page.underscore}"
  end

  resources :articles, only: %i[index show]
  resources :feedbacks, only: %i[create] do
    post "reset", on: :collection
  end

  get "/:section/:slug", to: "content#show"
  get "/:slug", to: "content#show"

  root to: "content#index"
end

Rails.application.routes.draw do
  get "/check" => "application#check"
  get "/health" => "application#check"

  # Note These have to be above the wildcard route
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
  get "/503", to: "errors#service_unavailable", via: :all

  # explicit redirect for old link
  get "/get-help-to-improve-your-practice/send-meeting-the-needs-of-all-children", to: redirect("/get-help-to-improve-your-practice/meeting-the-needs-of-all-children")

  resources :settings, only: %i[show create]

  devise_for :users
  namespace :admin do
    root to: "users#index"
    resources :users
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
    post "preview_markdown", to: "content_pages#preview"
  end

  %w[accessibility-statement contact-us disclaimer child-development-training].each do |static_page|
    get "/#{static_page}", to: "static_pages##{static_page.underscore}"
  end

  resources :feedbacks, only: %i[create]

  get "/:section/:slug", to: "content#show"
  get "/:slug", to: "content#show"

  root to: "content#index", constraints: -> { ENV.fetch('DFE_DESIGN', nil).blank? }, as: :beta_root
  root to: "pages#home"
end

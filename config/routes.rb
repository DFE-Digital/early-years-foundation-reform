Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", to: "devise/sessions#destroy"
  end

  post "/govspeak/", to: "govspeak#show"

  # Note These have to be above the wildcard route
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  resources :content_pages, path: '/cms/pages'
  resources :content_assets, path: '/cms/assets'

  get "/", to: "content#index"
  get "/*section/:slug", to: 'content#show'
  get "/:slug", to: 'content#show'

  root to: "content#index"

  get "check" => "application#check"

end

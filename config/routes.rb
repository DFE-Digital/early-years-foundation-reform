Rails.application.routes.draw do

  post "/govspeak/", to: "govspeak#show"

  resources :content_pages, path: '/cms/pages'
  get "/cms/pages", to: "content_pages#index"
  get "/cms/pages*section/:slug", to: 'content_pages#show'
  get "/cms/pages:slug", to: 'content_pages#show'

  resources :content_assets, path: '/cms/assets'

  get "/", to: "content#index"
  get "/*section/:slug", to: 'content#show'
  get "/:slug", to: 'content#show'

  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  root to: "content#index"

  get "check" => "application#check"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end

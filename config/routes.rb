Rails.application.routes.draw do
  resources :content_assets
  resources :content_pages

  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  root "content_pages#index"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end

Rails.application.routes.draw do
  get 'health', to: 'application#check'

  get '404', to: 'errors#not_found', via: :all
  get '422', to: 'errors#unprocessable_entity', via: :all
  get '500', to: 'errors#internal_server_error', via: :all
  get '503', to: 'errors#service_unavailable', via: :all

  # explicit redirect for old link
  get 'get-help-to-improve-your-practice/send-meeting-the-needs-of-all-children', to: redirect('/get-help-to-improve-your-practice/meeting-the-needs-of-all-children')

  constraints proc { Rails.application.preview? || Rails.env.test? } do
    resources :resources, id: /[^\/]+/, only: %i[show]
  end

  resources :settings, only: %i[create]

  get ':section', to: 'pages#index', format: 'html'
  get ':section/:slug', to: 'pages#show', format: 'html'
  get ':section/:overview/:slug', to: 'pages#show', format: 'html'

  # Handle unmatched route
  get '/*unmatched_route', to: 'errors#not_found', via: :get, format: 'html'
  get '/*unmatched_route/*unmatched_route', to: 'errors#not_found', via: :get, format: 'html'
  get '/*unmatched_route/*unmatched_route/*unmatched_route', to: 'errors#not_found', via: :get, format: 'html'

  post 'change', to: 'hook#change'
  post 'release', to: 'hook#release'

  root to: 'home#index'
end

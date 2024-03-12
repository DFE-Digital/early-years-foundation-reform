Rails.application.routes.draw do
  get '/check' => 'application#check'
  get '/health' => 'application#check'

  # Note These have to be above the wildcard route
  get '/404', to: 'errors#not_found', via: :all
  get '/422', to: 'errors#unprocessable_entity', via: :all
  get '/500', to: 'errors#internal_server_error', via: :all
  get '/503', to: 'errors#service_unavailable', via: :all

  # explicit redirect for old link
  get '/get-help-to-improve-your-practice/send-meeting-the-needs-of-all-children', to: redirect('/get-help-to-improve-your-practice/meeting-the-needs-of-all-children')

  resources :settings, only: %i[show create]

  resources :feedbacks, only: %i[create]

  get '/:section' => 'web/pages#index'
  get '/:section/:slug' => 'web/pages#show'
  get '/:section/:overview/:slug' => 'web/pages#show'

  root to: 'home#index'
end

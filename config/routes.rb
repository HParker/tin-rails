Rails.application.routes.draw do
  root to: 'home#index'
  get 'completion', to: 'completion#index'
  # get 'api', to: 'api#show'
  mount Api::Engine => "/api"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_out', :to => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

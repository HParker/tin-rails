Api::Engine.routes.draw do
  root to: 'application#show'
  get '/me', to: 'application#me'
end

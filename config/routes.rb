MuleMoving::Application.routes.draw do
  root 'home#hello'

  post '/moves', to: 'moves#create', as: :moves
  get '/movers', to: 'movers#index', as: :movers
end

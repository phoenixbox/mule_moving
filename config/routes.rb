MuleMoving::Application.routes.draw do
  root 'home#hello'

  get '/movers', to: 'movers#index', as: :movers
  get '/mover/:id', to: 'movers#show', as: :mover
end

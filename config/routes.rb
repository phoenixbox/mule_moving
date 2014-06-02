MuleMoving::Application.routes.draw do
  root 'home#hello'

  get '/movers', to: 'movers#index', as: :movers
  get '/mover/:id', to: 'movers#show', as: :mover

  post '/bookings', to: 'bookings#create', as: :bookings
  get '/confirmation', to: 'bookings#confirmation', as: :confirmation

  get '/health', to: 'health_check#show', as: :health_check
end

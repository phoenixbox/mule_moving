MuleMoving::Application.routes.draw do
  root 'home#hello'

  get '/services/:service', to: 'marketing#services', as: :service
  get '/process/:process', to: 'marketing#mule_process', as: :process

  get '/movers', to: 'movers#index', as: :movers
  get '/mover/:id', to: 'movers#show', as: :mover

  get '/mover/:id/bookings', to: 'bookings#new', as: :booking
  post '/bookings', to: 'bookings#create', as: :bookings
  get '/confirmation', to: 'bookings#confirmation', as: :confirmation

  get '/health', to: 'health_check#show', as: :health_check
end

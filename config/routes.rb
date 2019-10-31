Rails.application.routes.draw do
  get 'static/team'
  get 'static/contact'
  get 'sessions/profile'
  resources :gossips
  resources :sessions, only: [:new, :create, :destroy]
end

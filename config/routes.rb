Rails.application.routes.draw do
  get 'static/team'
  get 'static/contact'
  resources :gossips
end

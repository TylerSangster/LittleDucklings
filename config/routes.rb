Rails.application.routes.draw do
  # resources :staff_pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'page#coming_soon', as: :root
  get '/' => 'page#coming_soon'
  get '/home' => 'page#home'
  get '/lake' => 'page#lake'
  get '/pond' => 'page#pond'
  get '/locations' => 'page#locations'
  # resources :staff_pages

end

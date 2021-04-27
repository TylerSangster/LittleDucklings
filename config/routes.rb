Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'page#coming_soon', as: :root
  get '/' => 'page#coming_soon'
  get '/home' => 'page#home'
  get '/lake' => 'page#lake'
  get '/pond' => 'page#pond'
  get '/locations' => 'page#locations'

  resources :contacts

  resources :contact_submissions

  resources :page, only: [:new, :create]

  # get '/contact/new', to: 'contact#new'
end

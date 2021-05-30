Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'page#coming_soon', as: :root
  get '/' => 'page#coming_soon'
  get '/home' => 'page#home'
  get '/lake' => 'page#lake'
  get '/pond' => 'page#pond'
  get '/locations' => 'page#locations'
  get 'programs/infant' => 'page#infant'
  get 'programs/prekindergarten' => 'page#prekindergarten'
  get 'programs/preschool' => 'page#preschool'
  get 'programs/toddler' => 'page#toddler'
  resources :staff_pages, only: :show

  resources :blog_posts, only: :show
end

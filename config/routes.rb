Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'page#home', as: :root
  get '/' => 'page#home'
  get '/about' => 'page#about'
  get '/contact' => 'page#contact'
  get '/photos' => 'page#photos'
  get '/where' => 'page#where'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

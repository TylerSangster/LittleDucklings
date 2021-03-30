Rails.application.routes.draw do
  # devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'page#coming_soon', as: :root
  get '/' => 'page#coming_soon'
  get '/home' => 'page#home'
  get '/lake' => 'page#lake'
  get '/pond' => 'page#pond'
  match '/blog',        to: 'blog_posts#index', as: :blog_posts, via: :get
  match '/blog/:title', to: 'blog_posts#show', as: :blog_post, via: :get
  scope '/message', :controller => :message do
    post :confirm_reply
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

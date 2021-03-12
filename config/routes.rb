Rails.application.routes.draw do
  root to: 'page#home', as: :root
  get 'page/home'
  get 'page/about'
  get 'page/contact'
  get 'page/photos'
  get 'page/where'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

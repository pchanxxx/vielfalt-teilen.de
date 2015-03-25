Kirsi::Application.routes.draw do

  resources :zeichens, only: [:index, :create], path: '/zeichensetzen'

  root to: "categories#index"

  namespace :admin do
    resources :categories
    resources :posts
    resources :events
    resources :users
    resources :static_images, only: [:create]
    resources :zeichens, path: '/zeichen'
  end

  get '/admin', to: 'admin/posts#index'

  devise_for :users

  devise_scope :user do
    get "login", :to => "devise/sessions#new"
  end

  get "static/impressum"
  get '/impressum', to: 'static#impressum'

  resources :events

  resources :categories, path: '' do
    resources :posts
  end

end

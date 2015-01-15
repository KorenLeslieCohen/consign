Rails.application.routes.draw do

  # facebook
  get '/auth/facebook', as: "facebook_login"
  match 'auth/facebook/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  get '/logout' => 'sessions#destroy', :as => :logout 

  # get '/auth/facebook' => 'sessions#new'
  # get '/auth/facebook/callback' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

  resources :messages

  # post '/rate' => 'rater#create', :as => 'rate'
  root 'application#index'

  resources :neighborhoods
  resources :boroughs

  resources :photos
  resources :reviews

  # tags
  resources :designers #, :only => [:show, :index]
  resources :biztags #, :only => [:show, :index]
  resources :tags #, :only => [:show, :index]

  resources :businesses do 
    resources :reviews, :only => [:new, :create, :destroy]
    resources :photos
  end

  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  get "/:page" => "static#show"
end

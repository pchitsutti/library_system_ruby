Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :book_histories
  get 'homes/new'
  get 'homes/show' => 'homes#show', as: :home
  get 'sessions/signup' => 'sessions#signup', :as => :signup
  post 'sessions/new_user' => 'sessions#new_user'
  root :to => 'sessions#new'
  get    'login'   => 'sessions#new', :as => :loginpage
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

   get 'books/:id/borrow' => 'books#borrow', :as => :borrow_book
   get 'book_histories/:data/index' => 'book_histories#index', :as =>:check_user_history
   get 'books/:id/request' => 'books#request_book', :as => :request_book
   get 'books/:id/return' => 'books#return', :as => :return_book
   get 'books/:id/cancel_request' => 'books#cancel_request', :as => :cancel_request_book
  # post 'books/borrow[:book_id]'   =>  'searches#borrow'
  resources :searches
  resources :books
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root 'application#application'

  match ':controller(/:action(/:id))', :via=> :get


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
end

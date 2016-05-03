Rails.application.routes.draw do
  #resources :members
  #resources :groups
  resources :order_details
  get 'pages/index'
  get 'users/index'
  root to: 'pages#index'
  resources :invited_friends
  resources :orders
  resources :friends
  resources :invited_fiends
  resources :orders
  resources :groups do 
   resources :members
  end
  resources :friends
  #devise_for :users
  get 'groups/group_member/:id', to: 'groups#group_member'
  get 'users/invite' ,to:"users#invite"
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

 get 'friendapproved'=>'orders#friendapproved'
 get 'friendunapproved'=>'orders#friendunapproved'

resources :orders do
resources :invited_friends
end
resources :users do
  get :autocomplete_user_email, :on => :collection
end
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #match '/auth/facebook/callback' => 'session#authorize_callback'
  #match '/auth/facebook/setup' => 'session#setup'


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
end

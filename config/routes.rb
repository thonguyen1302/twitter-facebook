Devise2::Application.routes.draw do
  get   '/login', :to => 'sessions#new', :as => :login
  match 'users/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'  
  get '/logout', :to => 'sessions#destroy'

  

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :orders

  get "store/index", as: :stores

  resources :line_items

  resources :carts

  resources :products

  resources :posts

  get "home/index"
  
  

 # devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  devise_for :users, :controllers => {:registrations => "devise/registrations" , :sessions => "devise/sessions", omniauth_callbacks: "omniauth_callbacks" },
              path_names: {sign_in: "login", sign_out: "logout"}
                   
  
  devise_scope :users do
    get "sign_in", :to => "devise/sessions#new"
    #delete :sign_out, :to => "sessions#destroy"
    #get "users", :to => "sessions#new"
    #get "show", :to => "users#show"
  end
  resources :users
  
   
  

  devise_scope :admins do
   get "sign_in", :to => "sessions#new"
   
  end

  resources :admins

  root :to => "home#index"




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
    root to: 'store#index', as: 'store'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

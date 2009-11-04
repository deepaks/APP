ActionController::Routing::Routes.draw do |map|
  map.resources :clients

  map.resources :firms

  map.resources :project_tags

  map.resources :user_types

  map.resources :order_transactions

  map.resources :orders

  map.resources :service_plans

  map.resources :maps

  map.resources :videos
  map.resources :pictures
  map.resources :plaintexts
  map.resources :posts
  map.resources :projects
  map.resources :portfolios
  map.resources :accounts
  map.resources :mapping

  map.upload_to_gallery "upload_to_gallery",:controller => "gallery",:action => "upload_new"
  map.gallery "gallery", :controller => "gallery"
  map.customize "customize", :controller => "customize"
  
  map.members "members", :controller => "users", :action => "list"

  map.signup "signup", :controller => "accounts", :action => "new"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.forget_password "forget_password", :controller => "password_resets", :action => "new"
  map.reset_password "reset_password", :controller => "password_resets", :action => "edit"
  
  map.resources "user_sessions"
  map.resources "users"

  map.profile "profile", :controller => "users", :action => "show", :id => "current"
  map.edit_profile "edit_profile", :controller => "users", :action => "edit", :id => "current"

  map.topsecret "topsecret", :controller => "admin/index", :action => "topsecret"
  map.secret "secret", :controller => "admin/index", :action => "secret"
  
  map.sysadmin "manage", :controller => "admin/index", :action => "sysadmin"
  map.admin "admin", :controller => "admin/index", :action => "index"
  map.dashboard "dashboard", :controller => "admin/index", :action => "dashboard"
  
  map.app_root "main", :controller => "index",:action => "main"
  map.root :controller => "index", :action => "index"
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  map.connect ':controller/:id/:action/:part'
  #map.connect ':controller/:id/:action/:type/:object_id'
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

ActionController::Routing::Routes.draw do |map|
  map.resources :visarequests
  map.resources :loanapps
  map.resources :memberapps
  map.resources :reqinfos

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

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '/', :controller => 'home', :action => 'index'
  map.root :controller => 'home'
  
   map.cruise '/cruise', :controller => 'home', :action => 'cruise'
   map.visa '/visa', :controller => 'home', :action => 'visa'
   map.cunews '/cunews', :controller => 'home', :action => 'cunews'
   map.freesharedraft '/freesharedraft', :controller => 'home', :action => 'freesharedraft'
   map.atmloc '/atmloc', :controller => 'home', :action => 'atmloc'
   map.contact '/contact', :controller => 'home', :action => 'contact'
   map.branches5000 '/branches5000', :controller => 'home', :action => 'branches5000'
   map.pharmcard '/pharmcard', :controller => 'home', :action => 'pharmcard'
   map.browserreq '/browserreq', :controller => 'home', :action => 'browserreq'
   map.rates '/rates', :controller => 'home', :action => 'rates'
   map.calc '/calc', :controller => 'home', :action => 'calc'
   map.share_rates '/share_rates', :controller => 'home', :action => 'share_rates'
   map.cufees '/cufees', :controller => 'home', :action => 'cufees'
   map.truthinsavings '/truthinsavings', :controller => 'home', :action => 'truthinsavings'
   map.ira_certificates '/ira_certificates', :controller => 'home', :action => 'ira_certificates'
   map.vision_certificates '/vision_certificates', :controller => 'home', :action => 'vision_certificates'
   map.auto_loans '/auto_loans', :controller => 'home', :action => 'auto_loans'
   map.vehicle_loans '/vehicle_loans', :controller => 'home', :action => 'vehicle_loans'
   map.home_loans '/home_loans', :controller => 'home', :action => 'home_loans'
   map.other_loans '/other_loans', :controller => 'home', :action => 'other_loans'
   map.sitemap '/sitemap', :controller => 'home', :action => 'sitemap'
   map.apps '/apps', :controller => 'home', :action => 'apps'
   map.lifeevents '/lifeevents', :controller => 'home', :action => 'lifeevents'
   map.lifeevents_unexpected '/lifeevents_unexpected', :controller => 'home', :action => 'lifeevents_unexpected'
   map.lifeevents_retirement '/lifeevents_retirement', :controller => 'home', :action => 'lifeevents_retirement'
   map.lifeevents_marriage '/lifeevents_marriage', :controller => 'home', :action => 'lifeevents_marriage'
   map.lifeevents_house '/lifeevents_house', :controller => 'home', :action => 'lifeevents_house'
   map.lifeevents_college '/lifeevents_college', :controller => 'home', :action => 'lifeevents_college'
   map.lifeevents_car '/lifeevents_car', :controller => 'home', :action => 'lifeevents_car'
   map.lifeevents_baby '/lifeevents_baby', :controller => 'home', :action => 'lifeevents_baby'
   map.links '/links', :controller => 'home', :action => 'links'
   map.commroom '/commroom', :controller => 'home', :action => 'commroom'
   map.history '/history', :controller => 'home', :action => 'history'
   map.eligibility '/eligibility', :controller => 'home', :action => 'eligibility'
   map.cuvsbank '/cuvsbank', :controller => 'home', :action => 'cuvsbank'
   map.locations '/locations', :controller => 'home', :action => 'locations'
   map.savings '/savings', :controller => 'home', :action => 'savings'
   map.sharedraft '/sharedraft', :controller => 'home', :action => 'sharedraft'
   map.loanprod '/loanprod', :controller => 'home', :action => 'loanprod'
   map.otherservices '/otherservices', :controller => 'home', :action => 'otherservices'
   map.onlineservices '/onlineservices', :controller => 'home', :action => 'onlineservices'
   map.carsale '/carsale', :controller => 'home', :action => 'carsale'
end

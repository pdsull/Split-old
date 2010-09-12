ActionController::Routing::Routes.draw do |map|
   map.root :controller => "events"
   map.resources :users
   map.resources :user_sessions
   map.login "login", :controller => "user_sessions", :action => "new"
   map.logout "logout", :controller => "user_sessions", :action => "destroy"
   map.resources :home
   map.resources :families
   map.resources :members
   map.resources :password_reset
   
   map.addevent "addevent", :controller => "home", :action => "new_event"
   map.reset_password "request_reset", :controller => "home", :action => "request_reset_password"
   map.reset "reset/:id", :controller => "home", :action => "reset"
   
   map.test "test", :controller => "test", :action => "index"
   

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

Rails.application.routes.draw do
  root :to => "friend_requests#index"
  # Routes for the Status_comment resource:
  # CREATE
  get "/status_comments/new", :controller => "status_comments", :action => "new"
  post "/create_status_comment", :controller => "status_comments", :action => "create"

  # READ
  get "/status_comments", :controller => "status_comments", :action => "index"
  get "/status_comments/:id", :controller => "status_comments", :action => "show"

  # UPDATE
  get "/status_comments/:id/edit", :controller => "status_comments", :action => "edit"
  post "/update_status_comment/:id", :controller => "status_comments", :action => "update"

  # DELETE
  get "/delete_status_comment/:id", :controller => "status_comments", :action => "destroy"
  #------------------------------

  # Routes for the Status_update resource:
  # CREATE
  get "/status_updates/new", :controller => "status_updates", :action => "new"
  post "/create_status_update", :controller => "status_updates", :action => "create"

  # READ
  get "/status_updates", :controller => "status_updates", :action => "index"
  get "/status_updates/:id", :controller => "status_updates", :action => "show"

  # UPDATE
  get "/status_updates/:id/edit", :controller => "status_updates", :action => "edit"
  post "/update_status_update/:id", :controller => "status_updates", :action => "update"

  # DELETE
  get "/delete_status_update/:id", :controller => "status_updates", :action => "destroy"
  #------------------------------

  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

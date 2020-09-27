Rails.application.routes.draw do
  root "static_pages#home"
	
  get '/members_only', to: "static_pages#members_only"
  get '/admins_only', to: "static_pages#admins_only"
  passwordless_for :users
end

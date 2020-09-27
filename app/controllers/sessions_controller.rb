class SessionsController < ApplicationController

   skip_before_action :authorized, only: [:new, :create, :welcome, :logout]

   def new
   end

   def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to '/welcome'
      else
         redirect_to '/login'
      end
   end

   def login
   end

   def logout
      session.delete(:user_id)
      @current_user = nil
      redirect_to '/welcome'
   end 

   def welcome
      @total_rows = Tweet.count
   end

   def page_requires_login
   end
end

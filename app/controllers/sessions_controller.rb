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
      @quantity = params[:add]
      @addition = 50

      if(@quantity == nil && @quantity == 0) 
         @quantity = @addition
      else
         @quantity = @quantity.to_i + @addition
      end


      @tweets = Tweet.select(
         :id, 
         :likes, 
         :content, 
         :retweets, 
         :profile_img,
         :username,
         :created_at).joins(
         Tweet.arel_table.join(User.arel_table).on(
         User.arel_table[:username].eq(Tweet.arel_table[:username])
         ).join_sources
      ).order(created_at: :desc).limit(@quantity.to_i)
   end
end

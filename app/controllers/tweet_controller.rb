class TweetController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    Tweet.create(:username => current_user.username, :content =>params[:content], :likes => 0, :retweets => 0)
      
      redirect_to '/welcome'
  end
end

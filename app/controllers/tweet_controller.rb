class TweetController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :like]

  def new
  end

  def create
    Tweet.create(
      :username => current_user.username, 
      :content =>params[:content], 
      :likes => nil, 
      :retweets => nil)

      redirect_to '/welcome'
  end

  def retweet
    @tweet = Tweet.find_by(id: params[:id])

    Tweet.create(
      :username => current_user.username, 
      :content =>@tweet.content, 
      :likes => nil, 
      :retweets => params[:id])

      redirect_to '/welcome'
  end

  def like
    @tweet = Tweet.find_by(id: params[:id])

    if(@tweet.likes == nil)
      @tweet.likes = current_user.username
    else
      @tweet.likes += ";" + current_user.username
    end

    @tweet.update(:likes => @tweet.likes)
    redirect_to '/welcome'
  end

  def unlike
    @tweet = Tweet.find_by(id: params[:id])

    if(@tweet.likes != nil)
      @tweet.likes = @tweet.likes.sub(current_user.username, "") 
      @tweet.likes = @tweet.likes.sub(";;", current_user.username) 
    end

    @tweet.update(:likes => @tweet.likes)
    redirect_to '/welcome'
  end

  def view
    @tweet = Tweet.select(
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
   ).find_by(id: params[:id])

    if(@tweet.likes != nil)
      @users = User.select(Arel.star).where(User.arel_table[:username].in(@tweet.likes.split(';')))
    end
  end
end
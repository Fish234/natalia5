class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @signed_in = :false #TODO: add current user method
  end

  def members_only
  end

  def admin_only
    if current_user.role != "admin" #doubt current_user.role returns anything meaningful
      flash[:notice] = "unauthorized"
      redirect_to root_path
    end

  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  # Friendship Requests Methods
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def friends
    @user = User.find(params[:id])
    if @user == current_user
      @friends = current_user.active_friends
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendships page."
    end
  end

  def received_requests
    @user = User.find(params[:id])
    if @user == current_user
      @received_requests = current_user.received_requests
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendship requests page."
    end
  end

  def sent_requests
    @user = User.find(params[:id])
    if @user == current_user
      @sent_requests = current_user.sent_requests
    else
      redirect_to root_path
      flash[:alert] = "You don't have a permission to see #{@user.username}'s friendship requests page."
    end
  end
end
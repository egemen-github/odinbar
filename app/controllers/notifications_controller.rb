class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.limit(100)
  end

  def destroy_all
    if current_user.notifications.destroy_all
      flash[:notice] = 'All the notifications are deleted.'
      redirect_to posts_path
    end
  end
end

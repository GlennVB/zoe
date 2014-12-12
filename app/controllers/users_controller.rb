class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:read_notifications]
  skip_before_filter :verify_authenticity_token, only: [:read_notifications]
  before_action :set_user

  # Post settings page
  def update
    @user.update(user_params)
    redirect_to @user
  end
  
  # User personal info page
  def index
    
  end
  
  # User Settings Page
  def edit
    
  end
  
  # User Profile Page
  def show
    @user = User.find(params[:id] || params[:user_id])
  end
  
  def read_notifications
    current_user.user_updates.unread.each do |notification|
      notification.update_attribute(:read, true)
    end
    render nothing: true
  end
  
  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:email, :full_name, :username, :theme_preference)
  end
end

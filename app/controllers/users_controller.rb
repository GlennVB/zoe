class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user

  def update
    @user.update(user_params)
    render action: :index
  end
  
  def index
    
  end
  
  def edit
    
  end
  
  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:email, :full_name, :username, :theme_preference)
  end
end

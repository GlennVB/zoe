class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:read_notifications, :post_ants]
  skip_before_filter :verify_authenticity_token, only: [:read_notifications, :post_ants]
  before_action :set_user, except: [:post_ants]

  # Post settings page
  def update
    @user.update(user_params)
    redirect_to @user
  end
  
  # User personal info page
  def index
    @users = User.all
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
  
  def get_ants
    pos = @user.players.where(game_id: params[:game_id]).first.positions
    map = @user.players.where(game_id: params[:game_id]).first.los
    data = {}
    data["ants"] = []
    pos.each do |ant|
      data["ants"] << {"x" => ant.first, "y" => ant.last}
    end
    data["map"] = map
    render json: data
  end
  
  def post_ants
    if true
      puts params
      puts params[:data]
      current_user.players.where(game_id: params[:game_id]).first.store_data(params[:data])
    end
  end
  
  private
  def set_user
    @user = current_user || User.find(params[:user_id])
  end
  def user_params
    params.require(:user).permit(:email, :full_name, :username, :theme_preference, :profile)
  end
end

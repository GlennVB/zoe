class UsersController < ApplicationController
  before_action :set_user
  def get_ants
    puts "User requestex ants"
    render json: @user.ants, except: [:created_at, :updated_at, :user_id]
  end
  
  def post_ants
    puts "User posted ants"
    @ants = params[:ants]
    render nothing: true
  end
  
  private
  def set_user
    @user = User.find(params[:user_id].to_s || params[:user_id].to_s)
  end
end

class SafkesController < ApplicationController
  before_action :set_safke, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @safkes = current_user.safkes.all
    respond_with(@safkes)
  end

  def show
    respond_with(@safke)
  end

  def new
    current_user.relapse
    # @safke = Safke.new
    # respond_with(@safke)
    
  end

  def edit
  end

  def create
    @safke = Safke.new(safke_params)
    flash[:notice] = 'Safke was successfully created.' if @safke.save
    respond_with(@safke)
  end

  def update
    flash[:notice] = 'Safke was successfully updated.' if @safke.update(safke_params)
    respond_with(@safke)
  end

  def destroy
    @safke.destroy
    respond_with(@safke)
  end

  private
    def set_safke
      @safke = current_user.safkes.find(params[:id])
    end

    def safke_params
      params.require(:safke).permit(:user_id)
    end
end

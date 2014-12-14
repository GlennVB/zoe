class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @games = Game.all
    respond_with(@games)
  end

  def show
    respond_with(@game)
  end
  
  def map
    @game = Game.find(params[:game_id])
  respond_with @game do |format|
    format.html { render :layout => false }
  end
  end

  def new
    @game = Game.new
    @game.sizex=500
    @game.sizey=500
    @game.status="Open"
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.save
    respond_with(@game)
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :sizex, :sizey, :status)
    end
    

end
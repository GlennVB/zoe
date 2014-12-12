class ApiKeysController < ApplicationController
  before_action :set_api_key, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @api_keys = current_user.api_keys
    respond_with(@api_keys)
  end

  def show
    respond_with(@api_key)
  end

  def new
    @api_key = ApiKey.new
    @api_key.key = rand(36**24).to_s(36)
    respond_with(@api_key)
  end

  def edit
  end

  def create
    @api_key = current_user.api_keys.new(api_key_params)
    @api_key.save
    respond_with(@api_key)
  end

  def update
    @api_key.update(api_key_params)
    respond_with(@api_key)
  end

  def destroy
    @api_key.destroy
    respond_with(@api_key)
  end

  private
    def set_api_key
      @api_key = current_user.api_keys.find(params[:id])
    end

    def api_key_params
      params.require(:api_key).permit(:alias, :key, :status, :user_id)
    end
end

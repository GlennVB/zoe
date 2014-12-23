class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :js

  def index
    @ideas = Idea.published
    respond_with(@ideas)
  end

  def show
    respond_with(@idea)
  end

  def new
    @idea = current_user.ideas.new
    respond_with(@idea)
  end

  def edit
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    flash[:notice] = 'Idea was successfully created.' if @idea.save
    respond_with(@idea)
  end

  def update
    flash[:notice] = 'Idea was successfully updated.' if @idea.update(idea_params)
    respond_with(@idea)
  end

  def destroy
    @idea.destroy
    respond_with(@idea)
  end

  private
    def set_idea
      @idea = current_user.ideas.find(params[:id] || params[:idea_id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :completed, :user_id, :published)
    end
end

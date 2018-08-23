class TagsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    @tags = Tag.left_joins(:tickets).group('tags.id', 'tags.name').count('tickets.id')
    #@tags = Tag.all.includes(:tickets)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = 'Tag created'
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = 'Tag updated'
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      flash[:notice] = 'Tag deleted'
      redirect_to tags_path
    else
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
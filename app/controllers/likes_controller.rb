class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find_by(id: params[:id])
  end

  def new
  end

  def create
    @like = Like.new
    @like.user_id = params[:user_id]
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to "/likes/#{ @like.id }"
    else
      render 'new'
    end
  end

  def edit
    @like = Like.find_by(id: params[:id])
  end

  def update
    @like = Like.find_by(id: params[:id])
    @like.user_id = params[:user_id]
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to "/likes/#{ @like.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy


    redirect_to "/likes"
  end
end

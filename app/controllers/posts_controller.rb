class PostsController < ApplicationController
before_action :all_posts, only: [:feed, :create]
respond_to :html, :js

  def show
    @post = Post.find_by(id: params[:id])
  end

  
  def create
    @post = Post.create(post_params)
    @post.user = params['user']
    redirect_to "/feed"
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.caption = params[:caption]
    @post.content = params[:content]
    @post.image = params[:image]
    
    if @post.save
      redirect_to "/users/#{ @post.id }"
    else
      render 'edit'
    end
  end
  
  def feed
    @post = Post.new
  end
  
  private

    def all_posts
      @posts = Post.all
    end

    def post_params
      params.require(:post).permit(:caption, :content, :image)
    end
    
end
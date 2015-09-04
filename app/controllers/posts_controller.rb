class PostsController < ApplicationController
before_action :all_posts, only: [:feed, :create]
respond_to :html, :js

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  
  def create
    @post = Post.create(post_params)
    @post.user_id = params['user_id']
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
    @post.user_id = params[:user_id]
    
    if @post.save
      redirect_to "/posts/#{ @post.id }"
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
      params.require(:post).permit(:caption, :content, :image, :user_id)
    end
    
end
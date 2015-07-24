class PostsController < ApplicationController
before_action :all_posts, only: [:feed, :create]
respond_to :html, :js

def show
    @post = Post.find_by_id(params['id'])
  end

  
  def create
    @post = Post.create(post_params)
  end
  
  
  private

    def all_posts
      @posts = Post.all
    end

    def post_params
      params.require(:post).permit(:caption, :content, :image)
    end
    
end
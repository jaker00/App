class ApplicationController < ActionController::Base
  before_action :all_posts, only: [:feed, :create]
  respond_to :html, :js
  
  protect_from_forgery with: :exception
  
  def show
    @post = Post.find_by_id(params['id'])
  end

  def destroy
    p = Post.find_by_id(params['id'])
    p.destroy
    redirect_to "/feed"
  end
  
  def create
    @post = Post.create(post_params)
  end
  
  def edit
  @post = Post.find_by_id(params['id'])
  end
  
  def update
    p = Post.find_by_id(params['id'])
    p.caption = params['caption']
    p.content = params['content']
    p.image = params['image']
    p.save
    redirect_to "/posts/#{ p.id }"
  end
  
  private

    def all_posts
      @posts = Post.all
    end

    def post_params
      params.require(:post).permit(:caption, :content, :image)
    end
  
end

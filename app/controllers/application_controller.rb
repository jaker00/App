class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def show
    @post = Post.find_by_id(params['id'])
  end
  
  def feed
    @posts = Post.all
  end
  
  def destroy
    p = Post.find_by_id(params['id'])
    p.destroy
    redirect_to "/feed"
  end
  
  def create
    p = Post.new
    p.content = params['content']
    p.caption = params['caption']
    p.image = params['image']
    p.save
    redirect_to "/feed"
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
  
end

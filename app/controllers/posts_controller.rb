class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    content = @post.content
    malcov = content.split(/\n|\r|\s|。|、/)
    @post.content = malcov.shuffle
  end



private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end

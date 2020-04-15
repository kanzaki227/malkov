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
    marcov = content.split(/\n|\r|\s|。|、/)
    splitmarkov = marcov.shuffle
    @post.content = splitmarkov.join
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end


private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end

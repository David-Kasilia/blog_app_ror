class PostsController < ApplicationController
  def index
    @users = User.find_by(id: params[:user_id])
    @posts = @users.posts
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find_by(id: params[:user_id])
    @post = @author.posts.new(post_params)

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: ':( Cannot Create post retry again :('
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource

  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts.includes(:comments)
  end

  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find_by(id: params[:user_id])
    @post = @author.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: ':( Cannot Create post retry again :('
    end
  end

  def destroy
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @users.decrement!(:post_counter)
    @post.destroy
    redirect_to user_posts_path, notice: 'Deleted Post'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

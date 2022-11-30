class PostsController < ApplicationController
  def index
    @users = User.find_by(id: params[:user_id])
    @posts = @users.posts
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @new_post = Post.new
  end
end

class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)
    @post = Post.find_by(id: params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: ':( Cannot Create comment retry again :('
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:text)
  end
end

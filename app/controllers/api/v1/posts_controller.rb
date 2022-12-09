class Api::V1::PostsController < Api::V1::ApiController 

  before_action :authenticate_request

  def index
   user_id = params[:user_id]
   @posts = User.find(user_id).posts
   render json: @posts, status: :ok
  end

end

require_relative '../../../services/json_web_token'

class Api::V1::UsersController < Api::V1::ApiController 

  before_action :authenticate_request, except: [:login]

  def index
    render json: User.all
  end

  def login
    @user = User.find_by_email!(params[:email])
    if @user&.valid_password?(params[:password])
      token = JsonWebToken.encode({ id: @user.id })
      render json: { token: }
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end

end

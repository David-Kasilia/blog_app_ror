class Api::V1::AuthenticationController < Api::V1::ApiController
    skip_before_action :authenticate_token!

    def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password? params[:user][:password])
    render json: { token: JsonWebToken.encode(sub: user.id)
    else
    render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
    end
end
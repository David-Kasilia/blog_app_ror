class Api::V1::ApiController < ApplicationController
  # attr_reader :current_user
  skip_before_action :verify_authenticity_token
  before_action :set_default_format
  before_action :authenticate_token!

  private

  def set_default_format
    request.format = :json
  end
  
  def authenticate_token!
    unless request.headers['Authorization'].present?
      render json: { message: 'Authorization token missing' }, status: :unprocessable_entity and return
    end
    auth_token = request.headers["Authorization"]
    payload = JsonWebToken.decode(auth_token)
    create_current_user(payload)
    rescue JWT::ExpiredSignature
      render json: { error: 'Auth Token Has expired' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { error: 'Invalid Token' }, status: :unauthorized
  end

  # def auth_token
  #  @auth_token = request.headers['Authorization']
  # end

  def create_current_user(decoded_token)
    id = decoded_token[0]['id']
    @current_user = User.find(id)
  end

end

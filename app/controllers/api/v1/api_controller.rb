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
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
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

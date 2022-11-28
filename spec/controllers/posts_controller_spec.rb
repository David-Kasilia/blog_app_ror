require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index, params: { user_id: 123, param: :user_id }
      expect(response.status).to eq(200)
    end
    it 'has a 200 status code' do
      get :index, params: { user_id: 123, param: :user_id }
      expect(response).to render_template('posts')
    end
  end
end

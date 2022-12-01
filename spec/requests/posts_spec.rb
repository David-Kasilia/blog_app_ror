require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/:user_id/posts'
    end
    it "renders 'index' template" do
      expect(response).to render_template('users')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
    it "response body includes correct placeholder text." do
      get '/users/:user_id/posts'
      expect(response.body).to include(" Display The List Of Posts By A User ")
  end
  it 'response body includes correct placeholder text.' do
    get '/users/:user_id/posts/:id'
    expect(response.body).to include("Display The A Posts By A User")
  end
  end
end

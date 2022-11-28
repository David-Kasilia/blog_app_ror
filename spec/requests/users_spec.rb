require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end
    it "response body includes correct placeholder text." do
      get '/users'
      expect(response.body).to include("Display The List Of Users")
  end
  it 'response body includes correct placeholder text.' do
    get '/users/:id'
    expect(response.body).to include("Display The User Details")
  end
  end
end

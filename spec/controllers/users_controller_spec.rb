require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get '/'
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get '/'
      expect(response).to render_template('users')
    end
  end
end

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template 'index'
    end

    it 'sets the user if they are signed in' do
      user = create :user
      session[:user_id] = user.id

      get :index
      expect(assigns(:user)).to eq user
    end
  end
end

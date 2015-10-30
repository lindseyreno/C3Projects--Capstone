require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    it 'without login, session[:user_id] is nil' do
      create :user

      expect(session[:user_id]).to be nil
    end

    context 'invalid user params' do
      let(:invalid_user_sign_in_params) { { session: { username: 'sam', password: 'password' } } }

      before :each do
        user = create :user
        post :create, invalid_user_sign_in_params
      end

      it 'does not set session[:user_id]' do
        expect(session[:user_id]).to be nil
      end

      it 'flashes error message' do
        expect(flash[:errors]).to include('There was a problem signing in. Please try again.')
      end

      it 'redirects to home page' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'valid user params and user is not activated' do
      let(:user_sign_in_params) { { session: { username: 'sam', password: 'user_password' } } }

      before :each do
        @user = create :user, activated: false, activated_at: nil
        post :create, user_sign_in_params
      end

      it 'does not set session[:user_id]' do
        expect(session[:user_id]).to be nil
      end

      it 'flashes error message' do
        expect(flash[:errors]).to include('Account not activated. Check your email for the activation link.')
      end

      it 'redirects to the home page' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'valid user params and user is activated' do
      let(:user_sign_in_params) { { session: { username: 'sam', password: 'user_password' } } }

      before :each do
        @user = create :user
        post :create, user_sign_in_params
      end

      it 'sets the user' do
        expect(assigns(:user)).to eq @user
      end

      it "sets session[:user_id] to the user's id" do
        expect(session[:user_id]).to eq @user.id
      end

      it 'flashes message' do
        expect(flash[:messages]).to include('You have successfully signed in.')
      end

      it 'redirects to the home page' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      user = create :user
      session[:user_id] = user.id
      delete :destroy
    end

    it 'resets session[:user_id] to nil' do
      expect(session[:user_id]).to eq nil
    end

    it 'flashes message' do
      expect(flash[:messages]).to include('You have signed out.')
    end

    it 'redirects to the home page'do
      expect(response).to redirect_to(root_path)
    end
  end
end

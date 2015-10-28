require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do
    context 'valid user params' do
      before :each do
        ActionMailer::Base.deliveries.clear # have to clear deliveries or all tests will add to it, resulting in size = 3 for test 'sends an activation email to the user'
        build :user
        post :create, user: attributes_for(:user)
      end

      it 'creates a user' do
        expect(User.count).to eq 1
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end

      it 'sends an activation email to the user' do
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end
    end

    context 'invalid user params' do
      it 'flashes error message' do
        user = build :user, username: nil
        post :create, user: attributes_for(:user, username: nil)

        expect(user).to_not be_valid
        expect(flash[:errors]).to eq('There was a problem with your sign up info. Please try again.')
      end

      it 'redirects to the home page' do
        post :create, user: attributes_for(:user, username: nil)

        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'the signed in user is editing their own profile' do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :edit, id: user
      end

      it 'returns successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the edit view' do
        expect(response).to render_template('edit', session[:user_id])
      end
    end

    context "the signed in user is trying to edit another user's profile" do
      before :each do
        user = create :user
        user1 = create :user, username: 'sammy', email: 'user1@user1.com'
        session[:user_id] = user.id
        get :edit, id: user1.id
      end

      it 'returns with an HTTP 302 status code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'attempting to edit a user when not signed in' do
      before :each do
        user = create :user
        get :edit, id: user.id
      end

      it 'returns with an HTTP 302 status code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end

      it 'flashes an error message' do
        expect(flash[:errors]).to include('You must be signed in to view this page.')
      end
    end
  end

  describe 'GET #edit_preferences' do
    context 'the signed in user is editing their own preferences' do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :edit_preferences, id: user
      end

      it 'returns successfully with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the edit_preferences view' do
        expect(response).to render_template('edit_preferences', session[:user_id])
      end
    end

    context "the signed in user is trying to edit another user's preferences" do
      before :each do
        user = create :user
        user1 = create :user, username: 'sammy', email: 'user1@user1.com'
        session[:user_id] = user.id
        get :edit_preferences, id: user1
      end

      it 'returns with an HTTP 302 status code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end
    end

    context "attempting to edit a user's preferences when not signed in" do
      before :each do
        user = create :user
        get :edit_preferences, id: user
      end

      it 'returns with an HTTP 302 status code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end

      it 'flashes an error message' do
        expect(flash[:errors]).to include('You must be signed in to view this page.')
      end
    end
  end

  describe 'PATCH #update' do
    describe 'user not signed in' do
      before :each do
        user = create :user
        patch :update, id: user
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end

      it 'flashes an error message' do
        expect(flash[:errors]).to include('You must be signed in to view this page.')
      end
    end

    describe 'user signed in' do
      context 'valid user_params' do
        before :each do
          @user = create :user
          session[:user_id] = @user.id
          patch :update, id: @user, user: { username: 'sam', email: 'sammy@user.com', password: 'user_password', password_confirmation: 'user_password' }
          @user = assigns(:user)
        end

        it 'updates the user record' do
          user = User.find(session[:user_id])
          expect(@user.email).to eq user.email
        end

        it 'flashes a success message' do
          expect(flash[:messages]).to include 'Changes successfully saved.'
        end

        it 'redirects to the home page' do
          expect(response).to redirect_to root_path
        end
      end

      context 'invalid user_params' do
        before :each do
          @user = create :user
          session[:user_id] = @user.id
          patch :update, id: session[:user_id], user: { username: 'sam', email: nil, password: 'user_password', password_confirmation: 'user_password' }
          @user = assigns(:user)
        end

        it 'does not update the user record' do
          user = User.find(session[:user_id])
          expect(@user.email).to_not eq user.email
        end

        it 'renders the edit page' do
          expect(response).to render_template('edit', session[:user_id])
        end
      end
    end
  end

  describe 'PATCH #update_preferences' do
    describe 'user not signed in' do
      before :each do
        user = create :user
        patch :update_preferences, id: user
      end

      it 'redirects to the home page' do
        expect(subject).to redirect_to(root_path)
      end

      it 'flashes an error message' do
        expect(flash[:errors]).to include('You must be signed in to view this page.')
      end
    end

    describe 'user signed in' do
      context 'valid user_params' do
        before :each do
          @user = create :user
          @category = create :category
          @user.categories = [@category]
          session[:user_id] = @user.id
        end

        it 'unassociates the user from all categories when no checkboxes are checked' do
          patch :update_preferences, id: @user
          @user = assigns(:user)

          expect(@user.categories).to eq []
        end

        it 'associates a category with the user when a checkbox is checked' do
          category2 = create :category, name: 'Film'

          patch :update_preferences, id: @user, user: { category_ids: [@category.id, category2.id] }
          @user = assigns(:user)

          expect(@user.categories.length).to eq 2
          expect(@user.categories).to include(category2)
        end

        it 'associates a schedule with a user' do
          schedule = create :schedule

          patch :update_preferences, id: @user, schedule_id: schedule.id
          @user = assigns(:user)

          expect(@user.schedule_id).to eq schedule.id
          expect(Schedule.find(@user.schedule_id).name).to eq 'Every Day'
        end

        it 'flashes a success message' do
          patch :update_preferences, id: @user
          @user = assigns(:user)

          expect(flash[:messages]).to include 'Changes successfully saved.'
        end
      end
    end
  end
end

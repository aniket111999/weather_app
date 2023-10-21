require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'redirects to root_path' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(root_path)
      end

      it 'sets a flash notice message' do
        post :create, params: { user: attributes_for(:user) }
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid attributes' do
      it 'renders the new template' do
        post :create, params: { user: attributes_for(:user, email: nil) }
        expect(response).to render_template(:new)
      end

      it 'sets a flash error message' do
        post :create, params: { user: attributes_for(:user, email: nil) }
        expect(flash[:error]).to be_present
      end
    end
  end
end

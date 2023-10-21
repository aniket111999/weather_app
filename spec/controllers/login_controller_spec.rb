require 'rails_helper'

describe LoginController, type: :controller do
  let(:valid_attributes) { { username: 'test@example.com', password: 'password123' } }
  let(:invalid_attributes) { { username: 'test@example.com', password: 'wrongpassword' } }
  let(:user) { create(:user) }


  describe 'POST #create' do
    context 'with valid attributes' do
      it 'redirects to the weather path' do
        post :create, params: { login: valid_attributes }
        expect(response).to redirect_to(weather_path)
      end

      it 'sets a success flash message' do
        post :create, params: { login: valid_attributes }
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do
      it 'renders the new template' do
        post :create, params: { login: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it 'sets an error flash message' do
        post :create, params: { login: invalid_attributes }
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs the user out' do
      # Implement this test, depending on how your log_out method works
    end
  end
end

require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET #show' do
    context 'with a valid city' do
      it 'returns a successful response' do
        # Stub the API call
        allow(Net::HTTP).to receive(:get).and_return('{"cod":200, "weather": [{"main": "Clear"}]}')

        get :show, params: { city_name: 'ValidCity' }
        expect(response).to have_http_status(:success)
      end

      it 'renders the weather_data template' do
        # Stub the API call
        allow(Net::HTTP).to receive(:get).and_return('{"cod":200, "weather": [{"main": "Clear"}]}')

        get :show, params: { city_name: 'ValidCity' }
        expect(response).to render_template('weather_data')
      end
    end

    context 'with an invalid city' do
      it 'sets a flash error message' do
        # Stub the API call
        allow(Net::HTTP).to receive(:get).and_return('{"cod":404, "message": "Not Found"}')

        get :show, params: { city_name: 'InvalidCity' }
        expect(flash[:error]).to be_present
      end

      it 'renders the weather template' do
        # Stub the API call
        allow(Net::HTTP).to receive(:get).and_return('{"cod":404, "message": "Not Found"}')

        get :show, params: { city_name: 'InvalidCity' }
        expect(response).to render_template('weather')
      end
    end
  end

  describe 'GET #home' do
    it 'renders the weather template' do
      get :home
      expect(response).to render_template('weather')
    end
  end
end

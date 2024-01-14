# spec/controllers/api/events_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::EventsController, type: :controller do
    include Devise::Test::IntegrationHelpers
    include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:event) { create(:event) }
  let(:valid_attributes) { attributes_for(:event) }
  let(:invalid_attributes) { attributes_for(:event, name: nil) }

  before { sign_in user }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new event' do
        expect {
          post :create, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it 'renders a JSON response with the new event' do
        post :create, params: { event: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new event' do
        expect {
          post :create, params: { event: invalid_attributes }
        }.to change(Event, :count).by(0)
      end

      it 'renders a JSON response with errors for the new event' do
        post :create, params: { event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: event.to_param }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:event) }

      it 'renders a JSON response with the updated event' do
        put :update, params: { id: event.to_param, event: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the event' do
        put :update, params: { id: event.to_param, event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end

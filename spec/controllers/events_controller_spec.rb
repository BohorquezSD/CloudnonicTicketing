require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new event' do
        valid_params = { event: { name: "Ruby conf",
        description: "Ruby conferences event",
        location: "San Diego",
        start_time: DateTime.current+ 1.month,
        end_time: DateTime.current+ 1.month + 3.days,
        ticket_price: 300.5 } }
        expect { post :create, params: valid_params }.to change(Event, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new event' do
        invalid_params = { event: { name: nil,
        description: "Ruby conferences event",
        location: "San Diego",
        start_time: DateTime.current+ 1.month,
        end_time: DateTime.current+ 1.month + 3.days,
        ticket_price: -300.5 } }
        expect { post :create, params: invalid_params }.not_to change(Event, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Buyer name can't be blank", "Quantity must be greater than 0", "Total price must be greater than 0")
      end
    end
  end

end

# spec/controllers/api/tickets_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::TicketsController, type: :controller do
    include Devise::Test::IntegrationHelpers
    include Devise::Test::ControllerHelpers
    let(:user) { create(:user) }
    let(:event) { create(:event) }
    let(:ticket) { create(:ticket, event: event) }
    let(:valid_attributes) { attributes_for(:ticket, event_id: event.id) }
    let(:invalid_attributes) { attributes_for(:ticket, event_id: nil) }

    before do
        sign_in user
    end

    describe 'POST #create' do
        context 'with valid parameters' do
        it 'creates a new ticket' do
            expect {
            post :create, params: { ticket: valid_attributes }
            }.to change(Ticket, :count).by(1)
        end

        it 'renders a JSON response with the new ticket' do
            post :create, params: { ticket: valid_attributes }
            expect(response).to have_http_status(:created)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end

        context 'with invalid parameters' do
        it 'does not create a new ticket' do
            expect {
            post :create, params: { ticket: invalid_attributes }
            }.to change(Ticket, :count).by(0)
        end

        it 'renders a JSON response with errors for the new ticket' do
            post :create, params: { ticket: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end
    end

    describe 'GET #show' do
        it 'returns a successful response' do
        get :show, params: { id: ticket.to_param }
        expect(response).to have_http_status(:ok)
        end
    end

    describe 'GET #by_event' do
        it 'returns a successful response' do
        get :by_event, params: { event_id: event.to_param }
        expect(response).to have_http_status(:ok)
        end
    end

    describe 'PUT #update' do
        context 'with valid parameters' do
        let(:new_attributes) { attributes_for(:ticket, quantity: 5) }

        it 'updates the requested ticket' do
            put :update, params: { id: ticket.to_param, ticket: new_attributes }
            ticket.reload
            expect(ticket.quantity).to eq(5)
        end

        it 'renders a JSON response with the updated ticket' do
            put :update, params: { id: ticket.to_param, ticket: new_attributes }
            expect(response).to have_http_status(:ok)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end

        context 'with invalid parameters' do
        it 'renders a JSON response with errors for the ticket' do
            put :update, params: { id: ticket.to_param, ticket: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        end
    end
end

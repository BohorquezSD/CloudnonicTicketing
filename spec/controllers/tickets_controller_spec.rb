# spec/controllers/tickets_controller_spec.rb

require 'rails_helper'

describe TicketsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'when user is signed in' do
      before { sign_in user }

      it 'renders the new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'when user is signed in' do
      before { sign_in user }

      context 'with valid parameters' do
        it 'creates a new ticket' do
          valid_params = { ticket: { event_id: 1, buyer_name: 'John Doe', quantity: 2, total_price: 50.0 } }
          expect { post :create, params: valid_params }.to change(Ticket, :count).by(1)
          expect(response).to have_http_status(:created)
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new ticket' do
          invalid_params = { ticket: { event_id: 1, buyer_name: '', quantity: 0, total_price: -10.0 } }
          expect { post :create, params: invalid_params }.not_to change(Ticket, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when user is not signed in' do
      it 'does not create a new ticket and redirects to the sign-in page' do
        post :create, params: { ticket: { event_id: 1, buyer_name: 'John Doe', quantity: 2, total_price: 50.0 } }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

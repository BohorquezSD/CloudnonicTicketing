class Api::TicketsController < ApplicationController
    before_action :authenticate_user!, only: [ :create]
    
    
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
            render json: @ticket, status: :created
        else
            render json: @ticket.errors, status: :unprocessable_entity
        end
    end
    
    
    def show
        @ticket = Ticket.find(params[:id])
        render json: @ticket, status: :ok
    end
    
    def by_event
        @tickets = Ticket.where(event_id: params[:event_id])
        render json: @tickets, status: :ok
    end

    def update
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
            render json: @ticket, status: :ok
        else
            render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    private
    
      def ticket_params
        params.require(:ticket).permit(:event_id, :buyer_name, :quantity, :total_price)
      end
end

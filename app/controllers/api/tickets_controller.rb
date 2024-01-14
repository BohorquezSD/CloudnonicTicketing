class Api::TicketsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def new
        @ticket = Ticket.new
    end
    
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
    end
    
    def by_event
        @tickets = Tickets.where(event_id: params[:event_id])
        render json: @tickets
    end

    private
    
      def ticket_params
        params.require(:ticket).permit(:event_id, :buyer_name, :quantity, :total_price)
      end
end

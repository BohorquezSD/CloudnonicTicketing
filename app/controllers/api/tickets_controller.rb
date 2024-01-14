class Api::TicketsController < ApplicationController
    before_action :authenticate_user!, only: [ :create, :update ]
    
    
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
    rescue StandardError => e
        Rails.logger(e)
        render json: { error: "Ticket not found" }, status: :not_found
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
        params.require(:ticket).permit(:event_id, :buyer_name, :quantity)
      end

      
end

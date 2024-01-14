class Api::EventsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :update]

    def create
        @event = Event.new(event_params)
        if @event.save
            render json: @event, status: :created
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end
    
    def index
        @events = Event.all 
        render json: @events, status: :ok
    end

    def show
        @event = Event.find(params[:id])
        render json: @event, status: :ok
    rescue StandardError => e
        Rails.logger(e)
        render json: { error: "Event not found" }, status: :not_found
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            render json: @event, status: :ok
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end
    
    private

        def event_params
            params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :ticket_price)
        end
end

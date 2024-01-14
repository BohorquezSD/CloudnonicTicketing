class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def new
        @event = Event.new
    end
    
    def create
        @event = event.new(event_params)
        if @event.save
            render json: @event, status: :created
        else
            render json: @event.errors, status: :unprocessable_entity
        end
    end
    
    def index
        load_collection 
        render json: @events, status: :ok
    end

    def show
        @event = Event.find(params[:id])
        render json: @event, status: :ok
    end
    
    private

        def load_collection
            @events = Event.all
        end

        def event_params
            params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :ticket_price)
        end
end

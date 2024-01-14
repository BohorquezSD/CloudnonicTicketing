class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def handle_unverified_request
      respond_to do |format|
        format.html { super }
        format.json { render json: { error: 'Invalid authenticity token' }, status: :unprocessable_entity }
      end
    end
  
end

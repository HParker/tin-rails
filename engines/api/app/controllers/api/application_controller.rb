module Api
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception

    def show
      render json: Responder::Processor.response(params[:q]).as_json
    end
  end
end

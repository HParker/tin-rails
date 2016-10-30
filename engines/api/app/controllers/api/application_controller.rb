module Api
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception
    JOB = {
      reminder: ReminderWorker
    }

    def show
      response, work = Responder::Processor.response(params[:q], current_user)
      if work.present?
        JOB[work[0]].perform_in(work[1], work[2])
      end
      render json: response.as_json
    end

    protected

    def current_user
      User.find_by(id: session[:user_id])
    end
  end
end

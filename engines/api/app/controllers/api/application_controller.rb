module Api
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception
    JOB = {
      reminder: ReminderWorker
    }

    def show
      response, work = Responder::Processor.response(params[:q])
      if work.present?
        JOB[work[0]].perform_in(work[1], work[2])
      end
      render json: response.as_json
    end
  end
end

require 'responder'

class CompletionController < ApplicationController
  def index
    render json: Responder::Processor.completions
  end
end

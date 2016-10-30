# frozen_string_literal: true
require_relative '../base'
module Responder
  class Login < Base
    KEYWORD = 'login'

    keyword KEYWORD, info: '[username] allows you to be you'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      time = ::Time.now
      {
        time: time.strftime("%l:%M %p"),
        date: time.strftime('%A, %B %e, %G')
      }
    end
  end
end

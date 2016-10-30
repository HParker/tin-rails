# frozen_string_literal: true
require_relative '../base'
module Responder
  class Time < Base
    KEYWORD = 'time'

    keyword KEYWORD, info: 'Just returns the time'

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

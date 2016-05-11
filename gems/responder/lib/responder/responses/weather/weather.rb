# frozen_string_literal: true
module Responder
  class Weather < Base
    KEYWORD = 'weather'

    keyword KEYWORD, info: "show the current forecast"

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      if @info.weather
        {
          summary: @info.weather.currently.summary,
          temperature: @info.weather.currently.apparentTemperature,
          humidity: @info.weather.currently.humidity
        }
      else
        {
          summary: 'unknown',
          temperature: 'n/a',
          humidity: 'n/a'
        }
      end
    end
  end
end

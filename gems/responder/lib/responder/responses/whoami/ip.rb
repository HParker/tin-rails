# frozen_string_literal: true
require 'maxminddb'

module Responder
  class Ip < Base
    KEYWORD = 'whoami'

    keyword KEYWORD, info: 'Show your identification'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      {
       ip: @info.ip,
       city: @info.city_name,
       country: @info.country_name
      }
    end
  end
end

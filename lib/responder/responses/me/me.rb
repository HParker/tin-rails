# frozen_string_literal: true
require_relative '../base'
require 'maxminddb'

module Responder
  class Me < Base
    KEYWORD = 'me'

    keyword KEYWORD, info: 'Show your identity'

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
       country: @info.country_name,
       user: @info.user
      }
    end
  end
end

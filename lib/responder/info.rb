# frozen_string_literal: true
module Responder
  class Info
    attr_reader :text, :user

    def initialize(text, req, user)
      @text = text
      @req = req
      @user = user
    end

    def keyword
      tokens.first.downcase
    end

    def has_contents?
      tokens.size > 1
    end

    def contents
      args.join(' ').strip
    end

    def args
      tokens.drop(1)
    end

    def ip
      @req.ip
    end

    def time

    end

    def city_name
      db.city.name
    end

    def country_name
      db.country.name
    end

    def weather
      forecast
    end

    private

    def forecast
      @forecart ||= ForecastIO.forecast(db.location.latitude, db.location.longitude)
    end

    def tokens
      @text.split(' ')
    end

    def db
      MaxMindDB.new(File.join(RESPONDER_ROOT, '../db/GeoLite2-City.mmdb')).lookup(ip)
    end
  end
end

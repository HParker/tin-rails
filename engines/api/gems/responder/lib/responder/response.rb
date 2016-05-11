# frozen_string_literal: true
module Responder
  class Response
    attr_reader :title, :body, :refresh_rate, :refresh_url

    def initialize(title:, body:, refresh_rate:, refresh_url:)
      @title = title
      @body = body
      @refresh_rate = refresh_rate
      @refresh_url = refresh_url
    end

    def as_json
      {
        title: title.to_s.capitalize,
        body: body,
        refresh_rate: refresh_rate,
        refresh_url: refresh_url
      }
    end
  end
end

# frozen_string_literal: true
require_relative '../base'
module Responder
  class Todo < Base
    KEYWORD = 'todo'

    keyword KEYWORD, info: 'whatever you need to get done'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      { body: @info.contents }
    end
  end
end

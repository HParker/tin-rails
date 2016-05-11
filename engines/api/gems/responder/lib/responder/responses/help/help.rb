# frozen_string_literal: true
module Responder
  class Help < Base
    KEYWORD = 'help'

    keyword KEYWORD, info: "[command] show info about Tin"

    def title
      KEYWORD
    end


    def initialize(info)
      @info = info
    end

    def response
      Processor.obj_for(@info.args.first).new(nil).help
    end
  end
end

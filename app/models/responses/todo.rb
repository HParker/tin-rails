module Responses
  class Todo < Response
    KEYWORD = 'todo'

    keyword KEYWORD, info: 'whatever you need to get done'

    def initialize(info)
      @info = info
    end

    def title
      KEYWORD
    end

    def contents
      {
       body: @info.contents
      }
    end
  end

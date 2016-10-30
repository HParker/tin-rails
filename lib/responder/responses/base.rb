require 'mote'
require_relative '../processor'
module Responder
  class Base
    include Mote::Helpers

    def self.keyword(keyword, info: '')
      Responder::Processor.add_keyword(keyword, self, info)
    end

    def response
      Card.new(title: title,
               body: body
              )
    end

    def help
      Card.new(title: "help #{title}",
               body: mote(help_template_path),
              )
    end

    def body
      mote(template_path, contents)
    end

    def contents
      {}
    end

    def refresh_rate
      0
    end

    def refresh_url
      ''
    end

    private

    def help_template_path
      File.join(responses_path, "#{title}/help.mote")
    end

    def template_path
      File.join(responses_path, "#{title}/#{title}.mote")
    end

    def responses_path
      File.join(RESPONDER_ROOT, "responder/responses/")
    end
  end
end

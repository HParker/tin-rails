require 'mote'

module Responder
  class Base
    include Mote::Helpers

    def self.keyword(keyword, info: '')
      Responder::Processor.add_keyword(keyword, self, info)
    end

    def response
      Response.new(title: title,
                   body: body,
                   refresh_rate: refresh_rate,
                   refresh_url: refresh_url
                  )
    end

    def help
      Response.new(title: "help #{title}",
                   body: mote(help_template_path),
                   refresh_rate: refresh_rate,
                   refresh_url: refresh_url
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

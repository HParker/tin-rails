module Responder
  class Processor
    class << self

      def response(text, user)
        obj_for(info(text, user).keyword).new(info(text, user)).response
      end

      def info(text, user)
        Responder::Info.new(text, OpenStruct.new(ip: '0.0.0.0'), user)
      end

      def obj_for(keyword)
        keywords.dig(keyword, 0) || Help
      end

      def completions
        @completions ||= keywords.map do |key, val|
          { command: key, info: val.last }
        end
      end

      def add_keyword(keyword, klass, info)
        keywords[keyword] = [klass, info]
      end

      private

      def keywords
        @@keywords ||= {}
      end
    end
  end
end

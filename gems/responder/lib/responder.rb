require "responder/version"

module Responder
  RESPONDER_ROOT = __dir__
  Dir[File.join(RESPONDER_ROOT, '**/*.rb')].each { |f| require(f) }
end

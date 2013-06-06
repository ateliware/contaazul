require "netrc"
require "contaazul/configuration"
require "contaazul/version"
require "contaazul/error"
require "contaazul/client"

module Contaazul
  extend Configuration
  class <<self
    # Alias for Contaazul::Client.new
    #
    # @return [Contaazul::Client]
    def new(options = {})
      Contaazul::Client.new(options)
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

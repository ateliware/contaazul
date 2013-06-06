require 'contaazul/authentication'
require 'contaazul/connection'
require 'contaazul/request'

module Contaazul
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = Contaazul.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Contaazul::Authentication
    include Contaazul::Connection
    include Contaazul::Request

    # include Contaazul::Client::Resource
  end
end

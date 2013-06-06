require 'contaazul/authentication'
# require 'contaazul/connection'
# require 'contaazul/repository'
# require 'contaazul/request'

# require 'contaazul/client/github'

module Contaazul
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = Contaazul.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      login_and_password_from_netrc(options[:netrc])
    end

    include Contaazul::Authentication
    # include Contaazul::Connection
    # include Contaazul::Request

    # include Contaazul::Client::GitHub
  end
end

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

      Contaazul.company_token = options[:company_token] if options[:company_token]
    end

    include Contaazul::Authentication
    include Contaazul::Connection
    include Contaazul::Request

    def to_s
      return create_link unless false #authenticated?
      super
    end

    def create_link
      response = Contaazul.get("pub/oauth/requestkey/#{self.external_token}")

      "https://app.contaazul.com.br/authorization/request/#{response}?redirectTo=#{self.return_url}"
    end

    # Get all clients
    #
    # @return [Array(Hash)] Clients information
    def clients
      records = Contaazul.get("pub/contact/customer")
      records
    end

    # Get a single client
    #
    # @param id [String] ID of client to fetch
    # @return [Hash::Mash] Client information
    def client(id, options={})
      record = Contaazul.get("pub/contact/customer/#{id}")
      record
    end

    # Create a client
    #
    # @param options [Hash] client information.
    # @option options [String] :description
    # @return [Hashie::Mash] Newly created client info
    def create_client(options={})
      record = Contaazul.post("pub/contact/customer", options)
      record
    end

    # Edit a client
    #
    # @param id [String] Client ID
    # @param options [Hash] Client information.
    # @option options [String] :description
    # @return
    #   [Hashie::Mash] Newly updated client info
    def edit_client(id, options={})
      record = Contaazul.patch("pub/contact/customer/#{id}", options)
      record
    end

    # Delete a client
    #
    # @param id [String] Client ID
    # @return [Boolean] Indicating success of deletion
    def delete_client(id, options={})
      record = Contaazul.delete("pub/contact/customer/#{id}")
      record
    end

    # Get all cities
    #
    # @return [Array(Hash)] Cities information
    def cities
      records = Contaazul.get("pub/city")
      records
    end

    # Get a single city
    #
    # @param id [String] ID of city to fetch
    # @return [Hash::Mash] Client information
    def city(id)
      record = Contaazul.get("pub/city/#{id}")
      record
    end

  end
end

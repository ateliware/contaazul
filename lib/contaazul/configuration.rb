require 'faraday'
require 'contaazul/version'

module Contaazul
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :faraday_config_block,
      :api_version,
      :api_endpoint,
      :proxy,
      :oauth_token,
      :company_token,
      :external_token,
      :client_id,
      :client_secret,
      :user_agent,
      :request_host,
      :per_page].freeze

    DEFAULT_ADAPTER             = Faraday.default_adapter
    DEFAULT_API_VERSION         = 1
    DEFAULT_API_ENDPOINT        = ENV['CONTAAZUL_API_ENDPOINT'] || 'http://api.contaazul.com.br/pub/'
    DEFAULT_COMPANY_TOKEN       = ENV['CONTAAZUL_API_COMPANY_TOKEN']
    DEFAULT_EXTERNAL_TOKEN      = ENV['CONTAAZUL_API_EXTERNAL_TOKEN'] || "b6445aa301aaff61e641a0b85f26749e"
    DEFAULT_USER_AGENT          = "Contaazul Non-Official Ruby Gem #{Contaazul::VERSION}".freeze
    DEFAULT_AUTO_TRAVERSAL      = false

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    def company_token=(value)
      @company_token = value
    end

    def external_token=(value)
      @external_token = value
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.adapter             = DEFAULT_ADAPTER
      self.api_version         = DEFAULT_API_VERSION
      self.api_endpoint        = DEFAULT_API_ENDPOINT
      self.company_token       = DEFAULT_COMPANY_TOKEN
      self.external_token      = DEFAULT_EXTERNAL_TOKEN
      self.proxy               = nil
      self.oauth_token         = nil
      self.client_id           = nil
      self.client_secret       = nil
      self.request_host        = nil
      self.user_agent          = DEFAULT_USER_AGENT
    end
  end
end

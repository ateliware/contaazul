require 'faraday_middleware'

module Contaazul
  # @private
  module Connection
    private

    def connection(options={})
      options = {
        :authenticate     => true,
        :force_urlencoded => false,
        :raw              => false
      }.merge(options)

      if !proxy.nil?
        options.merge!(:proxy => proxy)
      end

      connection = Faraday.new(options) do |builder|

        if options[:force_urlencoded]
          builder.request :url_encoded
        else
          builder.request :json
        end

        builder.use FaradayMiddleware::FollowRedirects

        builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/

        faraday_config_block.call(builder) if faraday_config_block

        builder.adapter *adapter
      end

      connection.headers[:user_agent] = user_agent

      connection
    end
  end
end

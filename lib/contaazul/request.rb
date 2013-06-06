require 'multi_json'

module Contaazul
  module Request

    def delete(path, options={})
      request(:delete, path, options).body
    end

    def get(path, options={})
      response = request(:get, path, options)
      body = response.body

      body
    end

    def patch(path, options={})
      request(:patch, path, options).body
    end

    def post(path, options={})
      request(:post, path, options).body
    end

    def put(path, options={})
      request(:put, path, options).body
    end

    private

    # Executes the request, checking if it was successful
    #
    # @return [Boolean] True on success, false otherwise
    def boolean_from_response(method, path, options={})
     request(method, path, options).status == 204
    rescue Contaazul::NotFound
      false
    end

    def request(method, path, options={})
      path.sub(%r{^/}, '')

      token = options.delete(:oauth_token)  ||
              oauth_token

      force_urlencoded = options.delete(:force_urlencoded) || false

      url = options.delete(:endpoint) || api_endpoint

      conn_options = {
        :authenticate => token.nil?,
        :force_urlencoded => force_urlencoded,
        :url => url
      }

      response = connection(conn_options).send(method) do |request|

        request.headers['Accept'] =  options.delete(:accept) || 'application/json'

        if token
          request.headers[:authorization] = "token #{token}"
        end

        case method
        when :get
          request.url(path, options)
        when :delete, :head
          request.url(path, options)
        when :patch, :post, :put
          request.path = path
          if force_urlencoded
            request.body = options unless options.empty?
          else
            request.body = MultiJson.dump(options) unless options.empty?
          end
        end

        if Contaazul.request_host
          request.headers['Host'] = Contaazul.request_host
        end

      end

      response
    end

  end
end

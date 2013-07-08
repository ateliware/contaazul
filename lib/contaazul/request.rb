require 'multi_json'

module Contaazul
  module Request
    def get(path, options={})
      conn = Faraday.new(:url => self.api_endpoint) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
      conn.headers["CompanyToken"] = self.company_token || "";
      conn.headers["ExternalApplicationToken"] = self.external_token || "";

      response = conn.get(path)
      response.body
    end

    def patch(path, options={})
      conn = Faraday.new(:url => self.api_endpoint) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
      conn.headers["CompanyToken"] = self.company_token || "";
      conn.headers["ExternalApplicationToken"] = self.external_token || "";

      response = conn.patch(path)
      response.body
    end

    def post(path, options={})
      conn = Faraday.new(:url => self.api_endpoint) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.use FaradayMiddleware::ParseJson
      end
      conn.headers["CompanyToken"] = self.company_token || "";
      conn.headers["ExternalApplicationToken"] = self.external_token || "";

      response = conn.post(path, options)
      response.body
    end

    def delete(path, options={})
      conn = Faraday.new(:url => self.api_endpoint) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
      conn.headers["CompanyToken"] = self.company_token || "";
      conn.headers["ExternalApplicationToken"] = self.external_token || "";

      response = conn.delete(path)
      response.body
    end
  end
end


# puts ""
# puts "[ContaAzul] Endpoint/Path: #{self.api_endpoint}/#{path}"
# puts "[ContaAzul] CompanyToken: #{self.company_token}"
# puts "[ContaAzul] External: #{self.external_token}"
# puts ""

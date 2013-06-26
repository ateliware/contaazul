module Contaazul
  module Authentication
    def authenticated?
      !company_token.empty?
    end

    def oauthed?
      !oauth_token.nil?
    end
  end
end

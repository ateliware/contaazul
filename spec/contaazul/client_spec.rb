# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Contaazul::Client do

  before do
    Contaazul.reset
  end

  describe "api_endpoint" do

    after(:each) do
      Contaazul.reset
    end

    it "defaults to http://api.contaazul.com.br/pub/" do
      client = Contaazul::Client.new
      expect(client.api_endpoint).to eq('http://api.contaazul.com.br/pub/')
    end

    it "is set " do
      Contaazul.api_endpoint = 'http://lvh.me/'
      client = Contaazul::Client.new
      expect(client.api_endpoint).to eq('http://lvh.me/')
    end

  end

  context "when working with oauth tokens" do
    # raise @client
      # https://api.contaazul.com.br/pub/oauth/requestkey/SUA_CHAVE
      # to get the public token

      # so, call auth page popup as:
      # CALLBACK_URL => your callback page url, with http://
      # PUBLIC_TOKEN => public token from previous step

      # <a href="javascript:window.open(
      # 'http://app.contaazul.com.br/authorization/request/PUBLIC_TOKEN?
      # redirectTo=CALLBACK_URL',
      # 'popUpWindow',
      # 'toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=4
      # 30,
      # height=500')">
      # Desejo Integrar com o ContaAzul</a>

      # redirectTo é a URL de retorno para o Aplicativo XYZ. Para essa URL será passado um
      # parâmetro com a CompanyToken caso o usuário autentique. O parâmetro de retorno da
      # companyKey é authorizationToken. Exemplo:
      # http://www.aplicativoxyz.com?auhorizationToken=0000013e-7b7b-bbd6-0000-
      # 012a9b7962ba
      # A token 0000013e-7b50-5649-0000-007145a69e35 é única, uma vez chamada ela é
      # descartada, ou seja, caso seja aberto o popup e usuário fechar, deverá ser criada outra public
      # token. Esse procedimento garante a segurança das informações no caso de haver um sniffer
      # na rede, em outras palavras, caso alguém consiga interceptar esse link e tentar se conectar
      # pela segunda vez, não será possível, pois o token já foi descartado.

    before(:each) do
      Contaazul.reset
      @client = Contaazul::Client.new
    end

    it "should request and return a public token" do
      stub_get("oauth/requestkey/#{Contaazul.company_token}").
        to_return \
          :status => 200,
          :body => "1f74b13f1e5c6c69cb5d7fbaabb1e2cb",
          :header => {
            :content_type => 'application/json; charset=utf-8'
          }

      response = Contaazul.get "oauth/requestkey/#{Contaazul.company_token}"
      expect(response).to eq("1f74b13f1e5c6c69cb5d7fbaabb1e2cb")
      # set verify public_token, change this get to an auth method
      # remember, test Contaazul::Client.new passing :oauth_token
    end

  end

end

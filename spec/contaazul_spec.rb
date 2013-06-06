# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Contaazul do
  after do
    Contaazul.reset
  end

  describe ".respond_to?" do
    it "is true if method exists" do
      expect(Contaazul.respond_to?(:new, true)).to eq(true)
    end
  end

  describe ".new" do
    it "is a Contaazul::Client" do
      expect(Contaazul.new).to be_a Contaazul::Client
    end
  end
end

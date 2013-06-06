# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contaazul/version'

Gem::Specification.new do |spec|
  spec.name          = "contaazul"
  spec.version       = Contaazul::VERSION
  spec.authors       = ["Jo\xC3\xA3o Netto"]
  spec.email         = ["hi@joaonetto.me"]
  spec.description   = %q{A tiny non-official wrapper for ContaAzul's API}
  spec.summary       = %q{Integrate your ruby app with ContaAzul's API (contaazul.com.br)}
  spec.homepage      = "https://github.com/jnettome/contaazul"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'addressable', '~> 2.3.4'
  spec.add_dependency 'faraday', '~> 0.8.7'
  spec.add_dependency 'multi_json', '~> 1.7.6'

  spec.required_rubygems_version = '>= 1.8'
end

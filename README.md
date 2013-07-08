# contaazul
[![Dependency Status](https://gemnasium.com/ateliware/contaazul.png)](https://gemnasium.com/ateliware/contaazul) [![Build Status](https://travis-ci.org/ateliware/contaazul.png?branch=master)](https://travis-ci.org/ateliware/contaazul)

A tiny *non-official* wrapper for [ContaAzul](http://contaazul.com.br)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'contaazul'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contaazul

## Usage

### Clients

    $ Contaazul.clients # Get all
    $ Contaazul.client(id) # Get one
    $ Contaazul.create_client(options) # Create a client with parameters in options hash
    $ Contaazul.edit_client(id, options) # Update client passed in ID with params in options hash
    $ Contaazul.delete_client(id) # Remote client passed in ID

### Statements

    $ Contaazul.statements # Get all
    $ Contaazul.statement(id) # Get one
    $ Contaazul.create_statement(options) # Create a statement with parameters in options hash
    $ Contaazul.edit_statementid, options) # Update statement passed in ID with params in options hash
    $ Contaazul.delete_statement(id) # Remote statement passed in ID

### Cities

    $ Contaazul.cities # Get all
    $ Contaazul.city(id) # Get one

## More info about integration

See [official docs](https://app.contaazul.com.br/assets/doc/ContaAzulApiDoc_1_0.pdf).

## JSON dependency

Since JSON is included in 1.9 now, we no longer include it as a hard
dependency. Please require it explicitly if you're running Ruby 1.8

    gem 'json', '~> 1.7'


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Copyright

DO WHATEVER YOU WANT TO!
This project is basically a fork of [octokit.rb](https://github.com/octokit/octokit.rb)
See [LICENSE][] for details.

[license]: LICENSE.md

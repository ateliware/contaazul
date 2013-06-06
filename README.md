# contaazul
[![Dependency Status](https://gemnasium.com/jnettome/contaazul.png)](https://gemnasium.com/jnettome/contaazul)

A tiny *non-official* wrapper for [ContaAzul](http://contaazul.com.br)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'contaazul'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contaazul

## Usage

### Get all customers
    Contaazul.customers


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

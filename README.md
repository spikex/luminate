# Luminate

This gem provides Ruby bindings for the
[Luminate Online Server APIs](http://open.convio.com/api/#main).

## Installation

Add this line to your application's Gemfile:

    gem 'luminate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luminate

## Usage

Require the gem (or let bundler do it for you) and configure as
follows:

```ruby
require 'luminate'
Luminate.configure do |config|
  config.url          = 'https://secure3.convio.net'
  config.organization = 'your-organization'
  config.api_key      = 'your-api-key'
  config.api_login    = 'your-api-login-name'
  config.api_password = 'your-api-password'
end
```

The URL is typically https://secure2.convio.net or
https://secure3.convio.net. The organization is the short name Convio
uses to identify you. Both of these can be extracted from the URL of
your Admin panel:

```
https://secure2.convio.net/<organization>/admin...
```

You will need to configure the API key, login name, and password in
the Admin. Some endpoints are disabled by default, so be sure to check
the documentation.

The bindings are implemented as class level methods with one class per
API. The method names are underscorized version of Luminate's names.

To test your settings try the
[Constituent isEmailValid method](http://open.convio.com/api/#constituent_api.isEmailValid_method.html) (which simply checks the pattern of an email for validity):

```ruby
constituent = Luminate::Constituent
response = constituent.is_email_valid(email: 'spike@example.com')
 => {"isEmailValidResponse"=>{"valid"=>"true"}}
```

The response value is a [Map](https://github.com/ahoward/map), a
hash-like object that also provides methods to access the values.

```ruby
response['isEmailValidResponse']
 => {"valid"=>"true"}
 response.isEmailValidResponse
 => {"valid"=>"true"}
 response.isEmailValidResponse.valid
 => "true"
```

## Currently implemented methods

See [Contributing](#contributing) for how to add more.

* [Constituent: getUser](http://open.convio.com/api/#constituent_api.getUser_method.html)
* [Constituent: getUserTransactions](http://open.convio.com/api/#constituent_api.getUserTransactions_method.html)
* [Constituent: isEmailValid](http://open.convio.com/api/#constituent_api.isEmailValid_method.html)
* [Donation: addOfflineDonation](http://open.convio.com/api/#donation_api.addOfflineDonation_method.html)

## Contributing

This is version 0.1.0, I have only implement endpoints I'm actually
using and have (manually) tested. Since the interface is simple and
consistent, endpoints can be implement with a bit of
meta-programming. ```Luminate::Base``` provides a helper method,
```def_endpoints``` to do this. It takes the API's *Server Servlet*
name and the list of methods. See
[lib/luminate/constituent.rb](https://github.com/spikex/luminate/blob/master/lib/luminate/constituent.rb)
for an example.

Got changes?

1. Fork it ( http://github.com/spike/luminate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

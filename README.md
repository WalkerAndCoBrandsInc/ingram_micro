# IngramMicro
[![Build Status](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro.svg?branch=develop)](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro) Development

[![Build Status](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro.svg?branch=master)](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro) Latest Release


[IngramMicro](http://www.ingrammicro.com/IMD_WASWeb/jsp/login/corporate.jsp) HTTPS XML API wrapper.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ingram_micro'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ingram_micro


Modify the spec_helper.rb and provide a api_root. You can create one on requestb.in

## Run the Tests

    $ rake

## Usage

The `example.rb` script demonstrates how to use this gem. When
configured, it creates a sales order with Ingram Micro.

To see configuration options see `lib/ingram_micro/configuration.rb`

```
  IngramMicro.configure do |config|
    config.api_root = "https://ingramurl.com"
    config.partner_name = 'account name'
    config.partner_password = 'password'
    config.debug = true
    config.logger = Rails.logger
    config.timeout = 60         # open/read timeout in seconds
    config.open_timeout = 60    # connection open timeout in seconds
  end
```

The `IngramMicro::Client` class creates the connection to the Brightpoint API
using the Faraday gem. The `Transmission` super class has subclasses (i.e.
`SalesOrder`) that correspond to different uses of the API.

These subclasses create XML files, tackling one element at a time. Hence the
`BaseElement` class and its subclasses for each element found in the forms.
These elements are designed to create XML elements that are empty or containing
a default value (hence the `DEFAULTS` hash constant) if no values are provided,
which is why the RSpec tests can create a new `SalesOrder` without providing any
information.

**Note about Sales Orders:** there are two different schemas for sales order
submissions, one that is only for domestic orders and another that is for
domestic or international orders. If you are using the international-enabled
schema, you must set `international_schema` to `true` in your configuration
(`config.international_schema = true`). If you pass nothing in or set it to
`false`, the domestic-only schema will be used by default. Discuss with IMM to
determine which schema you will use.

XML files are validated against the XSD schemas from the API docs and then sent
the request to the API.

More detailed instructions for use will be provided once we have tested and
calibrated this gem to work properly with the API.

## For sites hosted in the cloud :cloud:

You may not be able to get a range of IPs for Ingram Micro to whitelist.
To get around this, you can route requests through
[tinyproxy](https://github.com/tinyproxy/tinyproxy).

Make sure to allow the ports that IngramMicro gives you to connect to e.g.

  tinyproxy.conf

```
  [...]
  ConnectPort 9443
  [...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Development with tinyproxy

e.g. on a mac with homebrew (homebrew puts tinyproxy in sbin)

    $ brew install tinyproxy

- create a tinyproxy.conf [Example](https://github.com/tinyproxy/tinyproxy/blob/186bbc3efb4b47caac0b5e14465c97918c99e442/etc/tinyproxy.conf.in)
- set your LogFile (config file does not understand ~ and needs full path)
- set ConnectPort for ports IMM uses

### Configuring Ingram Micro for a proxy

```
  IngramMicro.configure do |config|
    [...]
    config.proxy = 'http://localhost:8888'
  end
```

### Testing the proxy with curl

```
$ tinyproxy -d -c path/to/tinyproxy.conf
$ tail -f path/to/file.log
$ curl -x localhost:8888 https://blog.engineyard.com -v
```

You should see logging that the proxy is working!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WalkerAndCoBrandsInc/ingram_micro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

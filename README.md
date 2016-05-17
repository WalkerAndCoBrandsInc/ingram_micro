# IngramMicro
[![Build Status](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro.svg?branch=master)](https://travis-ci.org/WalkerAndCoBrandsInc/ingram_micro)

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

## Usage

```
  IngramMicro.configure do |config|
    config.api_root = "https://yourhttpsurlfrmoingram"
    config.debug = true
    config.logger = Rails.logger
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ingram_micro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ingram_micro'
require 'faker'
require 'support/fabrication'
require 'support/matchers'
require 'support/faker_dates'
require 'nori'

RSpec.configure do |rconfig|
  rconfig.before(:each) do
    IngramMicro.configure do |config|
      config.api_root = 'http://example.com'
      config.partner_name = Faker::Company.name
      config.partner_password = Faker::Internet.password
      # Arbitrary customer ID
      config.customer_id = 123
      config.debug = false
      config.proxy = nil
    end
  end
end

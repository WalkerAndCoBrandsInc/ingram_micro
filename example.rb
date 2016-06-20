lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ingram_micro'
require 'logger'

IngramMicro.configure do |config|
  config.api_root = ''
  config.ca_file = ''
  config.partner_name = 'Your company'
  config.partner_password = ''
  config.customer_id = '12345'
  config.source_url = ''
  config.debug = true
  config.logger = Logger.new(STDOUT)
end

options = {}
transmission = IngramMicro::SalesOrder.new(options)
transmission.send_request

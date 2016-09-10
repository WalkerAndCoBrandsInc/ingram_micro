require "nokogiri"
require "faraday"
require "faraday_middleware"
require "require_all"
require "securerandom"
require_rel 'ingram_micro/**/*.rb'

module IngramMicro
  GEM_DIR = (File.dirname(__FILE__) + '/../').freeze

  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
    configuration.assert_valid
  end

  def self.domestic_shipping?
    IngramMicro.configuration.domestic || true
  end

  def self.generate_order_number(prefix = '')
    "#{prefix}#{SecureRandom.random_number(89999) + 10000}"
  end

  class InvalidType < StandardError; end
  class MissingField < StandardError; end
  class XMLSchemaMismatch < StandardError; end
end

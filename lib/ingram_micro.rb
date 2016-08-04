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

  def self.generate_order_number(prefix='')
    if prefix.to_s.length == 0 || prefix.to_s.match(/^(\d)+$/)
      return "#{prefix}#{SecureRandom.random_number(89999) + 10000}"
    else
      return nil
    end
  end

  def self.extract_order_number(number)
    return nil unless number.to_s.match(/^(\d)+$/) || number.length < 6
    number[0...-5]
  end
end

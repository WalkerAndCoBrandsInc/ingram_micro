require "nokogiri"
require "faraday"
require "faraday_middleware"
require "require_all"
require_all 'lib/**/*.rb'

module IngramMicro
  GEM_DIR = (File.dirname(__FILE__) + '/../').freeze

  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
    configuration.assert_valid
  end
end

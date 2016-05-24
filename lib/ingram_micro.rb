require "nokogiri"
require "ingram_micro/version"
require "ingram_micro/configuration"
require "ingram_micro/sales_order"

module IngramMicro
  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
  end
end

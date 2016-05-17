require "ingram_micro/version"
require "ingram_micro/configuration"

module IngramMicro
  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
  end
end

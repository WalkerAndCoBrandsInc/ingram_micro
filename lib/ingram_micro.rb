require "nokogiri"
require "ingram_micro/version"
require "ingram_micro/configuration"
require "ingram_micro/customer"
require "ingram_micro/sales_order"
require "ingram_micro/shipment_information"
require "ingram_micro/credit_card_information"
require "ingram_micro/order_header"
require "ingram_micro/sales_order_detail"
require "ingram_micro/order_line_item"
require "ingram_micro/message_header"
require "ingram_micro/sales_order_submission"


module IngramMicro
  DIR = File.dirname(__FILE__).freeze

  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
  end
end

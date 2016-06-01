require "nokogiri"
require "faraday"
require "faraday_middleware"
require "ingram_micro/version"
require "ingram_micro/configuration"
require "ingram_micro/client"
require "ingram_micro/transmission"
require "ingram_micro/transmissions/sales_order"
require "ingram_micro/elements/base_element"
require "ingram_micro/elements/customer"
require "ingram_micro/elements/shipment_information"
require "ingram_micro/elements/credit_card_information"
require "ingram_micro/elements/order_header"
require "ingram_micro/elements/sales_order_detail"
require "ingram_micro/elements/order_line_item"
require "ingram_micro/elements/message_header_pw"
require "ingram_micro/elements/message_header_no_pw"
require "ingram_micro/elements/sales_order_submission"


module IngramMicro
  DIR = File.dirname(__FILE__).freeze

  def self.configuration
    @configuration ||= IngramMicro::Configuration.new
  end

  def self.configure
    yield configuration
  end

end

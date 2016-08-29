require 'nori'

class IngramMicro::InboundTransmissionFactory
  attr_reader :request_body_string

  def self.from_xml(request_body_string)
    new(request_body_string).from_xml
  end

  def initialize(request_body_string)
    begin
      Nokogiri::XML(request_body_string) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NONET
      end
    rescue Nokogiri::SyntaxError => e
      raise Error, "#{self.class.name} received malformed XML: #{request_body_string}: #{e.message}"
    end

    @request_body_string = request_body_string
  end

  def from_xml
    inbound_transmission_class.new(request_hash)
  end

  private

  def inbound_transmission_class
    case transaction_name
    when 'sales-order-success'
      IngramMicro::SalesOrderStatus
    when 'sales-order-rejection'
      IngramMicro::SalesOrderStatus
    when 'ship-advice'
      IngramMicro::ShipAdvice
    when 'inventory-synchronization'
      IngramMicro::InventorySync
    else
      raise Error, "#{self.class.name} received unrecognized transaction-name: #{transaction_name}"
    end
  end

  def transaction_name
    request_hash['message']['message_header']['transaction_name']
  end

  def request_hash
    @request_hash ||= Nori.new.parse(request_body_string)
  end

  class Error < StandardError; end
end

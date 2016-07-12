require 'nori'

class IngramMicro::InboundTransmissionFactory
  attr_reader :request_body_string

  def self.from_xml(request_body_string)
    new(request_body_string).from_xml
  end

  def initialize(request_body_string)
    @request_body_string = request_body_string
  end

  def from_xml
    raise "#{self.class.name} received malformed XML: #{request_body_string}" if request_hash.empty?
    inbound_transmission_class.new(request_hash)
  end

  private

  def inbound_transmission_class
    case transaction_name
    when 'sales-order-success'
      IngramMicro::SalesOrderSuccess
    when 'sales-order-rejection'
      IngramMicro::SalesOrderRejection
    when 'ship-advice'
      IngramMicro::ShipAdvice
    else
      raise "#{self.class.name} received unrecognized transaction-name: #{transaction_name}"
    end
  end

  def transaction_name
    request_hash['message']['message_header']['transaction_name']
  end

  def request_hash
    @request_hash ||= Nori.new.parse(request_body_string)
  end
end

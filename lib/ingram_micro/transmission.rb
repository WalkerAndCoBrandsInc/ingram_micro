class IngramMicro::Transmission
  XSD = {
    'sales-order-submission' => 'outbound/BPXML-SalesOrder.xsd',
    'shipment-status' => 'outbound/BPXML-ShipmentStatus.xsd',
    'return-authorization' => 'outbound/BPXML-ReturnAuthorization.xsd',
    'standard-response' => 'outbound/BPXML-StandardResponse.xsd',
    'load-reject' => 'inbound/BPXML-LoadReject.xsd',
    'load-success' => 'inbound/BPXML-LoadSuccess.xsd',
    'return-receipt' => 'inbound/BPXML-ReturnReceipt.xsd',
    'ship-advice' => 'inbound/BPXML-ShipAdvice.xsd'
  }.freeze

  attr_reader :errors, :transaction_name

  def initialize(options = {})
    @errors = []
  end

  # schema_valid? compares an xml document (the result of self.xml_builder) to
  # the appropriate xsd (XML Schema Definition).
  # NOTE: the order of the fields matters when checking against the xsd files.
  #   e.g. in the order-header of a sales order, if customer_channel_type
  #   appears first in the header elements, it will fail schema validation.
  #   It must be between order_type and customer_group_account or not present.
  def schema_valid?
    xsd = Nokogiri::XML::Schema(File.read("#{IngramMicro::GEM_DIR}/xsd/" +
      XSD[self.class::TRANSMISSION_FILENAME]))
    valid = true
    xsd.validate(xml_builder.doc).each do |error|
      errors << error.message
      valid = false
    end
    errors.each { |error| puts 'XML VALIDATION ERROR: ' + error }
    valid
  end

  def order_builder
    warn '[DEPRECATION] `order_builder` is deprecated.  Please use `xml_builder` instead.'
    xml_builder
  end

  def xml_builder
    raise StandardError, 'xml_builder needs to be implemented in subclass'
  end

  def add_transaction_info(builder)
    builder.send('transactionInfo') do
      builder.send('eventID')
    end
  end

  def submit_request
    raise IngramMicro::XMLSchemaMismatch, 'xml did not pass schema' unless schema_valid?
    send_request
  end

  def send_request
    IngramMicro::Client.new.post(xml_builder.to_xml)
  end
end

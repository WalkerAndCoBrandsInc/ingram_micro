class IngramMicro::Transmission
  XSD = {
    'sales-order-submission' => 'outbound/BPXML-SalesOrderDomestic.xsd',
    'sales-order-international' => 'outbound/BPXML-SalesOrderInternational.xsd',
    'shipment-status' => 'outbound/BPXML-ShipmentStatus.xsd',
    'return-authorization' => 'outbound/BPXML-ReturnAuthorization.xsd',
    'standard-response' => 'outbound/BPXML-StandardResponse.xsd',
    'load-reject' => 'inbound/BPXML-LoadReject.xsd',
    'load-success' => 'inbound/BPXML-LoadSuccess.xsd',
    'return-receipt' => 'inbound/BPXML-ReturnReceipt.xsd',
    'ship-advice' => 'inbound/BPXML-ShipAdvice.xsd'
  }

  attr_reader :errors, :transaction_name

  def initialize(options={})
    @errors = []
  end

  def schema_valid?
    xsd = Nokogiri::XML::Schema(File.read("#{IngramMicro::GEM_DIR}/xsd/" +
      XSD[self.class::TRANSMISSION_FILENAME]))
    valid = true
    xsd.validate(self.xml_builder.doc).each do |error|
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
    raise IngramMicro::XMLSchemaMismatch, 'xml did not pass schema' if !schema_valid?
    send_request
  end

  def send_request
    client = IngramMicro::Client.new
    client.post(self.xml_builder.to_xml)
  end
end

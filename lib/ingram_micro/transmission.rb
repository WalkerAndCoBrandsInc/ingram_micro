class IngramMicro::Transmission

  XSD = {
    "sales-order-submission" => "outbound/BPXML-SalesOrder.xsd",
    "shipment-status" => "outbound/BPXML-ShipmentStatus.xsd",
    "return-authorization" => "outbound/BPXML-ReturnAuthorization.xsd",
    "load-reject" => "inbound/BPXML-LoadReject.xsd",
    "load-success" => "inbound/BPXML-LoadSuccess.xsd",
    "return-receipt" => "inbound/BPXML-ReturnReceipt.xsd",
    "ship-advice" => "inbound/BPXML-ShipAdvice.xsd",
    "standard-response" => "inbound/BPXML-StandardResponse.xsd",
  }

  attr_reader :errors, :transaction_name

  def initialize(options={})
    @errors = []
  end

  def valid?
    xsd = Nokogiri::XML::Schema(File.read("#{IngramMicro::DIR}/../xsd/" +
      XSD[self.transaction_name]))
    valid = true
    xsd.validate(self.order_builder.doc).each do |error|
      errors << error.message
      valid = false
    end
    errors.each { |error| puts "XML VALIDATION ERROR: " + error }
    valid
  end

  def add_transaction_info(builder)
    builder.send("transactionInfo") do
      builder.send("eventID")
    end
  end

  def submit_request
    send_request if valid?
  end

  def send_request
    client = IngramMicro::Client.new
    client.post(self.order_builder.to_xml)
  end

end

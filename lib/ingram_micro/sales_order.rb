class IngramMicro::SalesOrder
  attr_reader :customer, :errors, :credit_card_information, :order_header,
  :shipment_information, :detail, :message_header

  def initialize(options={})
    @customer = options[:customer]
    @shipment_information = options[:shipment_information]
    @credit_card_information = options[:credit_card_information]
    @order_header = options[:order_header]
    @detail = options[:detail]
    @message_header = IngramMicro::MessageHeader.new({transaction_name: "sales-order-submission"})
    @errors = []
  end

  # def check_defaults
  #   [:customer, :credit_card_information, :order_header, :shipment_information, :detail]
  # end

  def valid?
    xsd = Nokogiri::XML::Schema(File.read("#{IngramMicro::DIR}/../xsd/outbound/BPXML-SalesOrder.xsd"))
    valid = true
    xsd.validate(order_builder.doc).each do |error|
      errors << error.message
      valid = false
    end
    errors.each { |error| puts "XML VALIDATION ERROR: " + error }
    valid
  end

  def order_builder
    @builder ||= Nokogiri::XML::Builder.new do |builder|
      builder.message do
        add_message_header(builder)
        add_sales_order_submission(builder)
        add_transaction_info(builder)
      end
    end
  end

  def add_message_header(builder)
    builder.send("message-header") do
      message_header.build(builder)
    end
  end

  def add_sales_order_submission(builder)
    sos_options = {
      detail: @detail,
      customer: @customer,
      shipment_information: @shipment_information,
      order_header: @order_header,
      credit_card_information: @credit_card_information
    }
    sos = IngramMicro::SalesOrderSubmission.new(sos_options)
    builder.send("sales-order-submission") do
      sos.build(builder)
    end
  end

  def add_transaction_info(builder)
    builder.send("transactionInfo") do
      builder.send("eventID")
    end
  end
end
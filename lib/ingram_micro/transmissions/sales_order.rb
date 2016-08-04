class IngramMicro::SalesOrder < IngramMicro::Transmission
  TRANSMISSION_FILENAME = 'sales-order-submission'

  attr_accessor :customer, :credit_card_information, :sales_order_header,
  :sales_order_shipment_information, :detail, :carrier_name, :business_name,
  :customer_id, :purchase_order_information

  def initialize(options={})
    super(options)
    @transaction_name = 'sales-order-submission'
    @customer = options[:customer]
    @sales_order_shipment_information = options[:sales_order_shipment_information]
    @purchase_order_information = options[:purchase_order_information]
    @credit_card_information = options[:credit_card_information]
    @sales_order_header = options[:sales_order_header]
    @detail = options[:detail]
    @business_name = options[:business_name]
    @customer_id = options[:customer_id]
    @carrier_name = options[:carrier_name]
    @purchase_order_information = options[:purchase_order_information]

    validate_options(options)
  end

  def xml_builder
    @builder ||= Nokogiri::XML::Builder.new do |builder|
      builder.message do
        add_message_header(builder)
        add_sales_order_submission(builder)
        add_transaction_info(builder)
      end
    end
  end

  def add_message_header(builder)
    message_header = IngramMicro::MessageHeaderPW.new({
      partner_name: IngramMicro.configuration.partner_name,
      transaction_name: transaction_name})
    builder.send('message-header') do
      message_header.build(builder)
    end
    message_header.valid?
  end

  def add_sales_order_submission(builder)
    sos_options = {
      detail: detail,
      business_name: @business_name,
      customer_id: @customer_id,
      carrier_name: @carrier_name,
      customer: customer,
      sales_order_shipment_information: sales_order_shipment_information,
      purchase_order_information: purchase_order_information,
      sales_order_header: sales_order_header,
      credit_card_information: credit_card_information,
      purchase_order_information: purchase_order_information
    }
    sos = IngramMicro::SalesOrderSubmission.new(sos_options)
    builder.send('sales-order-submission') do
      sos.build(builder)
    end
    sos.valid?
  end

  def validate_options(options)
    raise "use sales_order_shipment_information (IngramMicro::SalesOrderShipmentInformation" if options[:shipment_information]
    raise "use sales_order_header (IngramMicro::SalesOrderHeader" if options[:order_header]
  end
end

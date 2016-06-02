class IngramMicro::ReturnAuthorization < IngramMicro::Transmission
  attr_reader :customer, :credit_card_information, :order_header,
  :shipment_information, :detail, :purchase_order_information

  def initialize(options={})
    super
    @transaction_name = "return-authorization"
    @customer = options[:customer]
    @shipment_information = options[:shipment_information]
    @credit_card_information = options[:credit_card_information]
    @order_header = options[:order_header]
    @detail = options[:detail]
    @purchase_order_information = options[:purchase_order_information]
  end

  def order_builder
    @builder ||= Nokogiri::XML::Builder.new do |builder|
      builder.send("message") do
        add_message_header(builder)
        add_return_authorization_submission(builder)
      end
    end
  end

  def add_message_header(builder)
    message_header = IngramMicro::MessageHeaderPW.new({
      transaction_name: transaction_name})
    builder.send("message-header") do
      message_header.build(builder)
    end
  end

  def add_return_authorization_submission(builder)
    ra_options = {
      customer: @customer,
      shipment_information: @shipment_information,
      credit_card_information: @credit_card_information,
      order_header: @order_header,
      detail: @detail,
      purchase_order_information: @purchase_order_information
    }
    ras = IngramMicro::ReturnAuthorizationSubmission.new(ra_options)
    builder.send("return-authorization-submission") do
      ras.build(builder)
    end
  end

end

class IngramMicro::ReturnAuthorization < IngramMicro::Transmission
  TRANSMISSION_FILENAME = 'return-authorization'

  attr_accessor :customer, :customer_id ,:credit_card_information,
  :shipment_information, :detail, :purchase_order_information,
  :return_authorization_order_header

  def initialize(options={})
    super(options)
    @transaction_name = 'return-authorization'
    @customer = options[:customer]
    @shipment_information = options[:shipment_information]
    @credit_card_information = options[:credit_card_information]
    @return_authorization_order_header = options[:return_authorization_order_header]
    @detail = options[:detail]
    @customer_id = options[:customer_id] || IngramMicro.configuration.customer_id
    @purchase_order_information = options[:purchase_order_information]
  end

  def xml_builder
    @builder ||= Nokogiri::XML::Builder.new do |builder|
      builder.send('message') do
        add_message_header(builder)
        add_return_authorization_submission(builder)
      end
    end
  end

  def add_message_header(builder)
    message_header = IngramMicro::MessageHeaderPW.new({
      partner_name: IngramMicro.configuration.partner_name,
      transaction_name: transaction_name
    })
    builder.send('message-header') do
      message_header.build(builder)
    end
    message_header.valid?
  end

  def add_return_authorization_submission(builder)
    ra_options = {
      customer: customer,
      customer_id: customer_id,
      shipment_information: shipment_information,
      credit_card_information: credit_card_information,
      return_authorization_order_header: return_authorization_order_header,
      detail: detail,
      purchase_order_information: purchase_order_information,
    }
    ras = IngramMicro::ReturnAuthorizationSubmission.new(ra_options)
    builder.send('return-authorization-submission') do
      ras.build(builder)
    end
  end
end

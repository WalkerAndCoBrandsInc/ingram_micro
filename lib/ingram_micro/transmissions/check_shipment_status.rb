class IngramMicro::CheckShipmentStatus < IngramMicro::Transmission

  attr_reader :transaction_name

  def initialize(options={})
    super
    @transaction_name = 'shipment-status'
    @business_name = options[:business_name]
    @customer_id = options[:customer_id]
    @line_items = options[:line_items]
  end

  def order_builder
    @builder ||= Nokogiri::XML::Builder.new do |builder|
      builder.message do
        add_message_header(builder)
        add_shipment_status(builder)
        add_transaction_info(builder)
      end
    end
  end

  def add_message_header(builder)
    message_header = IngramMicro::MessageHeaderNoPW.new({
      transaction_name: transaction_name})
    builder.send('message-header') do
      message_header.build(builder)
    end
  end

  def add_shipment_status(builder)
    options = {
      business_name: @business_name,
      customer_id: @customer_id,
      line_items: @line_items
    }
    ss = IngramMicro::ShipmentStatus.new(options)
    builder.send('shipment-status') do
      ss.build(builder)
    end
  end
end

class IngramMicro::ReturnAuthorizationSubmission < IngramMicro::BaseElement

  DEFAULTS = {
    customer: nil,
    shipment_information: nil,
    credit_card_information: nil,
    order_header: nil,
    detail: nil,
    purchase_order_information: nil,
    customer_id: nil,
    business_name: nil,
    carrier_name: nil
  }

  def defaults
    DEFAULTS
  end

  def initialize(options={})
    super
    @element[:customer] ||= IngramMicro::Customer.new
    @element[:shipment_information] ||= IngramMicro::ReturnAuthorizationShipmentInformation.new
    @element[:credit_card_information] ||= IngramMicro::CreditCardInformation.new
    @element[:order_header] ||= IngramMicro::ReturnAuthorizationOrderHeader.new
    @element[:purchase_order_information] ||= IngramMicro::OutboundPurchaseOrderInformation.new
    @element[:detail] ||= IngramMicro::Detail.new
  end

  def build(builder)
    builder.send('header') do
      builder.send 'customer-id', @element[:customer_id]
      builder.send 'business-name', @element[:business_name]
      builder.send 'carrier-name', @element[:carrier_name]
      builder.send('customer-information') do
        @element[:customer].build(builder)
      end
      builder.send('shipment-information') do
        @element[:shipment_information].build(builder)
      end
      builder.send('purchase-order-information') do
        @element[:purchase_order_information].build(builder)
      end
      builder.send('credit-card-information') do
        @element[:credit_card_information].build(builder)
      end
      builder.send('order-header') do
        @element[:order_header].build(builder)
      end
    end
    check_line_items
    builder.send('detail') do
      @element[:detail].build(builder)
    end
  end

  def check_line_items
    if @element[:detail].element[:line_items].empty?
      line_item = IngramMicro::ReturnAuthorizationLineItem.new
      @element[:detail].element[:line_items] << line_item
    end
  end

  def valid?
    raise IngramMicro::InvalidType.new('customer_id must be a number') unless integer?(@element[:customer_id])
    true
  end
end

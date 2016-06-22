class IngramMicro::SalesOrderSubmission < IngramMicro::BaseElement

  DEFAULTS = {
    customer: nil,
    shipment_information: nil,
    credit_card_information: nil,
    order_header: nil,
    detail: nil,
    line_items: [],
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
    @element[:shipment_information] ||= IngramMicro::ShipmentInformation.new
    @element[:credit_card_information] ||= IngramMicro::CreditCardInformation.new
    @element[:order_header] ||= IngramMicro::SalesOrderHeader.new
    check_line_items
    @element[:detail] ||= IngramMicro::Detail.new({line_items: @element[:line_items]})
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
      builder.send('credit-card-information') do
        @element[:credit_card_information].build(builder)
      end
      builder.send('order-header') do
        @element[:order_header].build(builder)
      end
    end
    builder.send('detail') do
      @element[:detail].build(builder)
    end
  end

  def check_line_items
    if @element[:line_items].empty?
      line_item = IngramMicro::SalesOrderLineItem.new
      @element[:line_items] << line_item
    end
  end

  def valid?
    true
  end
end

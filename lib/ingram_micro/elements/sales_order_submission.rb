class IngramMicro::SalesOrderSubmission < IngramMicro::BaseElement

  DEFAULTS = {
    customer: nil,
    shipment_information: nil,
    credit_card_information: nil,
    order_header: nil,
    detail: nil
  }


  def defaults
    DEFAULTS
  end

  def initialize(options={})
    super
    @element[:customer] ||= IngramMicro::Customer.new
    @element[:shipment_information] ||= IngramMicro::ShipmentInformation.new
    @element[:credit_card_information] ||= IngramMicro::CreditCardInformation.new
    @element[:order_header] ||= IngramMicro::OrderHeader.new
    @element[:detail] ||= IngramMicro::SalesOrderDetail.new
  end

  def build(builder)
    builder.send("header") do
      builder.send "customer-id", 123456
      builder.send "business-name", "MegaGloboCo"
      builder.send "carrier-name", "FEDEX"
      builder.send("customer-information") do
        @element[:customer].build(builder)
      end
      builder.send("shipment-information") do
        @element[:shipment_information].build(builder)
      end
      builder.send("credit-card-information") do
        @element[:credit_card_information].build(builder)
      end
      builder.send("order-header") do
        @element[:order_header].build(builder)
      end
    end
    builder.send("detail") do
      @element[:detail].build(builder)
    end
  end

end

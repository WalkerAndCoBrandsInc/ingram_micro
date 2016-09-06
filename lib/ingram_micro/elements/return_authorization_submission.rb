module IngramMicro
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
    }.freeze

    def defaults
      DEFAULTS
    end

    def initialize(options = {})
      super
      @element[:customer] ||= Customer.new
      @element[:shipment_information] ||= OutboundShipmentInformation.new
      @element[:credit_card_information] ||= CreditCardInformation.new
      @element[:order_header] ||= ReturnAuthorizationOrderHeader.new
      @element[:purchase_order_information] ||=
        OutboundPurchaseOrderInformation.new
      @element[:detail] ||= Detail.new
    end

    def build(builder)
      builder.send('header') do
        builder.send 'customer-id', IngramMicro.configuration.customer_id
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
      builder.send('detail') do
        @element[:detail].build(builder)
      end
    end

    def valid?
      raise InvalidType.new('customer_id must be a number') unless integer?(IngramMicro.configuration.customer_id)
      true
    end
  end
end

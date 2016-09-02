module IngramMicro
  class SalesOrderSubmission < BaseElement
    DEFAULTS = {
      customer: nil,
      sales_order_shipment_information: nil,
      credit_card_information: nil,
      sales_order_header: nil,
      detail: nil,
      line_items: [],
      business_name: nil,
      carrier_name: nil,
      purchase_order_information: nil
    }.freeze

    def defaults
      DEFAULTS
    end

    def initialize(options = {})
      super
      @element[:customer] ||= Customer.new
      @element[:sales_order_shipment_information] ||= SalesOrderShipmentInformation.new
      @element[:credit_card_information] ||= CreditCardInformation.new
      @element[:sales_order_header] ||= SalesOrderHeader.new
      check_line_items
      @element[:detail] ||= Detail.new({line_items: @element[:line_items]})
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
          @element[:sales_order_shipment_information].build(builder)
        end
        if @element[:purchase_order_information]
          builder.send('purchase-order-information') do
            @element[:purchase_order_information].build(builder)
          end
        end
        builder.send('credit-card-information') do
          @element[:credit_card_information].build(builder)
        end
        builder.send('order-header') do
          @element[:sales_order_header].build(builder)
        end
      end
      builder.send('detail') do
        @element[:detail].build(builder)
      end
    end

    def check_line_items
      if @element[:line_items].empty?
        line_item = SalesOrderLineItem.new
        @element[:line_items] << line_item
      end
    end

    def valid?
      true
    end
  end
end

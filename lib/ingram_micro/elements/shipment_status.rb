module IngramMicro
  class ShipmentStatus < BaseElement
    DEFAULTS = {
      customer_id: nil,
      business_name: nil,
      detail: nil,
      line_items: []
    }.freeze

    def defaults
      DEFAULTS
    end

    def initialize(options = {})
      super
      @element[:order_header] ||= SalesOrderHeader.new
      @element[:detail] ||= Detail.new(line_items: @element[:line_items])
    end

    def build(builder)
      builder.send('header') do
        builder.send('customer-information') do
          builder.send 'customer-id', IngramMicro.configuration.customer_id
          builder.send 'business-name', @element[:business_name]
        end
      end
      builder.send('detail') do
        @element[:detail].build(builder)
      end
    end

    def valid?
      unless integer?(@element[:customer_id])
        raise InvalidType.new('customer_id must be a number')
      end
      true
    end
  end
end

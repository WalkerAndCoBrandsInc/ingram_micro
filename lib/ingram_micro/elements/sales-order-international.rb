class IngramMicro::SalesOrderInternational < IngramMicro::SalesOrderSubmission
  DEFAULTS = {
    customer: nil,
    sales_order_shipment_information: nil,
    credit_card_information: nil,
    sales_order_header: nil,
    detail: nil,
    line_items: [],
    customer_id: nil,
    business_name: nil,
    carrier_name: nil,
    purchase_order_information: nil
  }

  def initialize(options={})
    super
    @element[:sales_order_header] ||= IngramMicro::IntlSalesOrderHeader.new
    check_line_items
    @element[:detail] ||= IngramMicro::IntlDetail.new({line_items: @element[:line_items]})
  end
end

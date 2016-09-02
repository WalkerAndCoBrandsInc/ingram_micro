class IngramMicro::SalesOrderHeader < IngramMicro::BaseElement
  # The defaults here will be used to populate the xml fields. The order of
  # these inputs matters, and they have been reconfigured to pass the xsd file
  # provided by IMM for internationally shipped sales orders. If needed, we
  # can use different defaults and schema files for domestic and international
  # sales orders.
  DEFAULTS = {
    customer_order_number: 0,
    customer_order_date: nil,
    order_sub_total: 0.0,
    order_discount: 0.0,
    order_tax1: 0.0,
    order_tax2: 0.0,
    order_tax3: 0.0,
    order_shipment_charge: 0.0,
    order_total_net: 0.0,
    order_status: nil,
    order_type: nil,
    customer_channel_type: nil,
    customer_group_account: nil,
    customer_seller_code: nil,
    gift_flag: nil,
    packing_slip_format: nil,
    special_header_message: nil
  }.freeze

  format :customer_order_date, IngramMicro::DateFormatter.new

  def defaults
    DEFAULTS
  end

  def add_header_name_value(name, value, builder)
    IngramMicro::SalesOrderHeaderNameValue.new(name, value).build(builder)
  end
end

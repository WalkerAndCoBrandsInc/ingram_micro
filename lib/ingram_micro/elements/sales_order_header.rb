module IngramMicro
  class SalesOrderHeader < BaseElement
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
      special_header_message: nil,
      header_name_value: []
    }.freeze

    format :customer_order_date, IngramMicro::DateFormatter.new

    def defaults
      DEFAULTS
    end

    # Build similar to BaseElement except that we want to handle the
    # :header_name_value differently from other items.
    def build(builder)
      defaults.keys.each do |field|
        next if field == :header_name_value
        element_name = field.to_s.tr('_', '-')
        element_value = formatted_value_of(field)
        builder.send(element_name, element_value)
      end
      add_header_name_values(builder)
    end

    # Assume that element[:header_name_value] will be an array of arrays, with
    # each inner array a pair of strings, [name, value].
    def add_header_name_values(builder)
      element[:header_name_value].each do |pair|
        name, value = pair
        SalesOrderHeaderNameValue.new(name: name, value: value).build(builder)
      end
    end
  end
end

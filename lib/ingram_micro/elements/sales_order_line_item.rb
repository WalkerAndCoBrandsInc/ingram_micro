class IngramMicro::SalesOrderLineItem < IngramMicro::BaseElement

  DEFAULTS = {
    :line_no => nil,
    :item_code => nil,
    :universal_product_code => nil,
    :product_name => nil,
    :comments => nil,
    :quantity => 1.0,
    :unit_of_measure => nil,
    :sid => nil,
    :esn => nil,
    :min => nil,
    :mdn => nil,
    :irdb => nil,
    :imei => nil,
    :market_id => nil,
    :line_status => nil,
    :base_price => 0.0,
    :line_discount => 0.0,
    :line_tax1 => 0.0,
    :line_tax2 => 0.0,
    :line_tax3 => 0.0,
    :special_message => nil,
    :line_name_value => []
  }

  def line_no
    @element[:line_no]
  end

  def line_no=(num)
    @element[:line_no] = num
  end

  def build(builder)
    super(builder)
    # Expect that line_name_value will be an array of arrays, each of which
    # contains a name and value that will translate to line-attribute-name and
    # line-attribute-value.
    # unless element[:line_name_value].empty?
    #   name_value_pairs = element[:line_name_value]
    #   name_value_pairs.each do |pair|
    #     name, value = pair
    #     add_line_name_value(name, value, builder)
    #   end
    # end
  end

  # The <line-name-value> element in the detail of a line item of a sales order
  # is used for information related to international shipments. There can be
  # multiple line-name-value elements. More info in SalesOrderLineItemNameValue.
  def add_line_name_value(name, value, builder)
    IngramMicro::SalesOrderLineItemNameValue.new(name: name, value: value)
      .build(builder)
  end

  def defaults
    DEFAULTS
  end
end

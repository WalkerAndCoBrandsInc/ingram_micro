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
    :line_name_values => []
  }

  def line_no
    @element[:line_no]
  end

  def line_no=(num)
    @element[:line_no] = num
  end

  def build(builder)
    super(builder)

  end

  # Need to decide where these are coming from. Use Defaults?
  def line_name_value(name, value, builder)
    IngramMicro::SalesOrderLineItemNameValue.build(name, value, builder)
  end

  def defaults
    DEFAULTS
  end
end

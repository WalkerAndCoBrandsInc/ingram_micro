class IngramMicro::SalesOrderLineItem
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
  }

  DEFAULTS.keys.each{|field| attr_accessor field}

  def initialize(options={})
    DEFAULTS.each do |field, default|
      value = (options[field] ? options[field] : default)
      instance_variable_set("@#{field}", value)
    end
  end

  def build(builder)
      DEFAULTS.keys.each do |field|
        element_name = field.to_s.gsub("_", "-")
        element_value = instance_variable_get("@#{field}")
        builder.send(element_name, element_value)
      end
  end

end

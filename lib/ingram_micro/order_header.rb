class IngramMicro::OrderHeader
  DEFAULTS = {
    :customer_order_number => 0,
    :customer_order_date => nil,
    :order_sub_total => 0.0,
    :order_discount => 0.0,
    :order_tax1 => 0.0,
    :order_tax2 => 0.0,
    :order_tax3 => 0.0,
    :order_shipment_charge => 0.0,
    :order_total_net => 0.0,
    :order_status => "",
    :order_type => "",
    :gift_flag => ""}

  DEFAULTS.keys.each{|field| attr_accessor field}

  def initialize(options={})
    DEFAULTS.each do |field, default|
      value = (options[field] ? options[field] : default)
      instance_variable_set("@#{field}", value)
    end
    use_current_date?
  end

  def build(builder)
    DEFAULTS.keys.each do |field|
      element_name = field.to_s.gsub("_", "-")
      element_value = instance_variable_get("@#{field}")
      builder.send(element_name, element_value)
    end
  end

  def use_current_date?
    if @customer_order_date.nil?
      @customer_order_date = DateTime.now.strftime("%Y%m%d")
    end
  end
end

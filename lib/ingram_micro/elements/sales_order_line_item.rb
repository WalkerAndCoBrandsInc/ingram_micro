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
    :special_message => nil
  }

  attr_reader :line_name_value

  def defaults
    DEFAULTS
  end

  def initialize(options={})
    super
    @line_name_value = options[:line_name_value]
  end

  def line_no
    @element[:line_no]
  end

  def line_no=(num)
    @element[:line_no] = num
  end

  def build(builder)
    # Similar to BaseElement except we want to skip special_message and handle
    # it differently.
    defaults.keys.each do |field|
      unless field == :special_message
        element_name = field.to_s.gsub('_', '-')
        element_value = formatted_value_of(field)
        builder.send(element_name, element_value)
      end
    end
    # Expect that line_name_value will be an array of arrays, each of which
    # contains a name and value that will translate to line-attribute-name and
    # line-attribute-value.
    add_special_message(builder)
    unless line_name_value.nil?
      line_name_value.each do |pair|
        attr_name, attr_value = pair
        add_line_name_value(attr_name, attr_value, builder)
      end
    end
  end

  # The <line-name-value> element in the detail of a line item of a sales order
  # is used for information related to international shipments. There can be
  # multiple line-name-value elements. More info in SalesOrderLineItemNameValue.
  def add_line_name_value(name, value, builder)
    IngramMicro::SalesOrderLineItemNameValue.new(name: name, value: value).build(builder)
  end

  # The <special-message> element is optional, including some information
  # pertaining to international shipments. An instance of the class
  # IngramMicro::SalesOrderLineItemSpecialMessage is passed in on initialization
  # to make this work.
  def add_special_message(builder)
    message = element[:special_message]
    if message.nil?
      builder.send('special-message')
    else
      message.build(builder)
    end
  end

end

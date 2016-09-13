module IngramMicro
  class SalesOrderLineItem < BaseElement
    attr_reader :line_name_value

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
      :line_tax3 => 0.0
    }

    INTL_DEFAULTS = {
      line_no: nil,
      item_code: nil,
      universal_product_code: nil,
      product_name: nil,
      comments: nil,
      quantity: 1.0,
      unit_of_measure: nil,
      sid: nil,
      esn: nil,
      min: nil,
      mdn: nil,
      irdb: nil,
      imei: nil,
      market_id: nil,
      line_status: nil,
      base_price: 0.0,
      line_discount: 0.0,
      line_tax1: 0.0,
      line_tax2: 0.0,
      line_tax3: 0.0,
      special_message: nil,
      line_name_value: []
    }.freeze

    def line_no
      @element[:line_no]
    end

    def line_no=(num)
      @element[:line_no] = num
    end

    def defaults
      IngramMicro.domestic_shipping? ? DEFAULTS : INTL_DEFAULTS
    end

    def build(builder)
      # Similar to BaseElement except we want to skip special_message and
      # line_name_value and handle them differently.
      defaults.keys.each do |field|
        next if [:special_message, :line_name_value].include?(field)
        element_name = field.to_s.tr('_', '-')
        element_value = formatted_value_of(field)
        builder.send(element_name, element_value)
      end
      add_special_message(builder)
      # If this is an international shipment, then we need to add line-name-value
      # to the xml. Otherwise we can skip that.
      add_line_name_value(builder) unless IngramMicro.domestic_shipping?
    end

    # The <line-name-value> element in the detail of a sales order line item
    # is used for information related to international shipments. There can be
    # multiple line-name-value elements.
    # element[:line_name_value] is an array of arrays, where each inner array
    # is a pair of line-attribute-name and line-attribute-value.
    # See SalesOrderLineItemNameValue.
    def add_line_name_value(builder)
      element[:line_name_value].each do |pair|
        name, value = pair
        SalesOrderLineItemNameValue.new(name: name, value: value).build(builder)
      end
    end

    # The <special-message> element is optional, including some information
    # pertaining to international shipments. An instance of the class
    # IngramMicro::SalesOrderLineItemSpecialMessage is passed in on
    # initialization to make this work.
    def add_special_message(builder)
      message = element[:special_message]
      message.build(builder) if message
    end
  end
end

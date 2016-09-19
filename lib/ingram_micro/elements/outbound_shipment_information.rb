class IngramMicro::OutboundShipmentInformation < IngramMicro::BaseElement
  # COMMON contains keys between DEFAULTS and INTL_DEFAULTS.
  #
  # NOTE, the order of keys matters when doing XSD validations.
  COMMON = {
		ship_first_name:        nil,
		ship_last_name:         nil,
		ship_middle_initial:    nil,
		ship_address1:          nil,
		ship_address2:          nil,
		ship_address3:          nil,
		ship_city:              nil,
		ship_state:             nil,
		ship_post_code:         nil,
		ship_country_code:      nil,
		ship_phone1:            nil,
		ship_phone2:            nil,
		ship_fax:               nil,
		ship_email:             nil,
		ship_via:               nil,
		ship_request_date:      nil,
  }

  DEFAULTS = COMMON.merge({
		ship_request_from:      nil,
		ship_request_warehouse: nil
  })

  INTL_DEFAULTS = COMMON.merge({
    ship_no_later:          nil,
    no_ship_before:         nil,
    receive_no_later:       nil,
    no_receive_before:      nil,
    ship_request_from:      nil,
    ship_request_warehouse: nil,
    dock_date:              nil,
    ship_to_code:           nil
  }).freeze

  def defaults
    IngramMicro.domestic_schema? ? DEFAULTS : INTL_DEFAULTS
  end

  def valid_shipping_methods?
    shipping_method = element[:ship_via]
    !!IngramMicro::SHIPPING_METHODS[shipping_method]
  end

  def shipping_method_name
    if valid_shipping_methods?
      IngramMicro::SHIPPING_METHODS[element[:ship_via]]
    else
      'Invalid shipping code'
    end
  end

  def build(builder)
    add_ship_address2
    super(builder)
  end

  def add_ship_address2
    element[:ship_address2] = ' ' unless element[:ship_address2]
  end

  def valid?
    true
  end
end

class IngramMicro::OutboundShipmentInformation < IngramMicro::BaseElement

  SHIPPING_METHODS = {
    'FX01' => 'FedEx Standard Overnight',
    'FXAM' => 'FedEx Priority Overnight',
    'FX2D' => 'FedEx Second Day',
    'FXSP' => 'FedEx Smart Post',
    'FXIE' => 'FedEx International Economy',
    'FXIP' => 'FedEx International Priority',
    'FXSV' => 'FedEx Express saver (3 day)',
    'USPP' => 'Postal Priority',
    'GGRNDP' => 'Ground shipping',
    'FXL1' => 'FedEx Freight Overnight (Air)',
    'FXL2' => 'FedEx Freight 2-day (Air)',
    'FXL3' => 'FedEx Freight 3-day (Air)',
    'FXLE' => 'FedEx Freight Ground',
   }.freeze

  DEFAULTS = {
    ship_first_name: nil,
    ship_last_name: nil,
    ship_middle_initial: nil,
    ship_address1: nil,
    ship_address2: nil,
    ship_address3: nil,
    ship_city: nil,
    ship_state: nil,
    ship_post_code: nil,
    ship_country_code: nil,
    ship_phone1: nil,
    ship_phone2: nil,
    ship_fax: nil,
    ship_email: nil,
    ship_via: nil,
    ship_request_date: nil,
    ship_request_from: nil,
    ship_request_warehouse: nil
  }.freeze

  INTL_DEFAULTS = {
    ship_first_name: nil,
    ship_last_name: nil,
    ship_middle_initial: nil,
    ship_address1: nil,
    ship_address2: nil,
    ship_address3: nil,
    ship_city: nil,
    ship_state: nil,
    ship_post_code: nil,
    ship_country_code: nil,
    ship_phone1: nil,
    ship_phone2: nil,
    ship_fax: nil,
    ship_email: nil,
    ship_via: nil,
    ship_request_date: nil,
    ship_no_later: nil,
    no_ship_before: nil,
    receive_no_later: nil,
    no_receive_before: nil,
    ship_request_from: nil,
    ship_request_warehouse: nil,
    dock_date: nil,
    ship_to_code: nil
  }.freeze

  def defaults
    IngramMicro.domestic_schema? ? DEFAULTS : INTL_DEFAULTS
  end

  def valid_shipping_methods?
    shipping_method = element[:ship_via]
    !!SHIPPING_METHODS[shipping_method]
  end

  def shipping_method_name
    if valid_shipping_methods?
      SHIPPING_METHODS[element[:ship_via]]
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

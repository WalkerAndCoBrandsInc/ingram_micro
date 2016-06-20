class IngramMicro::ShipmentInformation < IngramMicro::BaseElement

  SHIPPING_METHODS = {
    'FX01' => 'FedEx Standard Overnight', #parcel
    'FXAM' => 'FedEx Priority Overnight', #parcel
    'FX2D' => 'FedEx Second Day', #parcel
    'FXSV' => 'FedEx Express saver (3 day)', #parcel
    'USPP' => 'Postal Priority', #parcel
    'GGRNDP' => 'Ground shipping', #parcel
    'FXL1' => 'FedEx Freight Overnight (Air)', #ltl freight
    'FXL2' => 'FedEx Freight 2-day (Air)', #ltl freight
    'FXL3' => 'FedEx Freight 3-day (Air)', #ltl freight
    'FXLE' => 'FedEx Freight Ground', #ltl freight
   }

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
  }

  def defaults
    DEFAULTS
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
end

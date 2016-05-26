class IngramMicro::ShipmentInformation < IngramMicro::BaseElement

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

end

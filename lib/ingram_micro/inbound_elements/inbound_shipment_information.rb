class IngramMicro::InboundShipmentInformation < IngramMicro::InboundBaseElement

  def ship_first_name
    hash['ship_first_name']
  end

  def ship_last_name
    hash['ship_last_name']
  end

  def ship_middle_initial
    hash['ship_middle_initial']
  end

  def ship_address1
    hash['ship_address1']
  end

  def ship_address2
    hash['ship_address2']
  end

  def ship_address3
    hash['ship_address3']
  end

  def ship_city
    hash['ship_city']
  end

  def ship_state
    hash['ship_state']
  end

  def ship_post_code
    hash['ship_post_code']
  end

  def ship_country_code
    hash['ship_country_code']
  end

  def ship_phone1
    hash['ship_phone1']
  end

  def ship_phone2
    hash['ship_phone2']
  end

  def ship_fax
    hash['ship_fax']
  end

  def ship_email
    hash['ship_email']
  end

  def ship_via
    hash['ship_via']
  end

  def ship_request_date
    hash['ship_request_date']
  end

  def ship_request_from
    hash['ship_request_from']
  end

  def ship_request_warehouse
    hash['ship_request_warehouse']
  end

end

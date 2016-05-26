class IngramMicro::Customer < IngramMicro::BaseElement

  DEFAULTS = {
    customer_first_name: nil,
    customer_last_name: nil,
    customer_middle_initial: nil,
    customer_address1: nil,
    customer_address2: nil,
    customer_address3: nil,
    customer_city: nil,
    customer_state: nil,
    customer_post_code: nil,
    customer_country_code: nil,
    customer_phone1: nil,
    customer_phone2: nil,
    customer_fax: nil,
    customer_email: nil
  }

  def defaults
    DEFAULTS
  end

end

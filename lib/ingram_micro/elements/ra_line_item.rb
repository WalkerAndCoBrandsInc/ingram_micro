class IngramMicro::ReturnAuthorizationLineItem < IngramMicro::BaseElement

  DEFAULTS = {
    line_no: nil,
    line_reference: nil,
    item_code: nil,
    universal_product_code: nil,
    product_name: nil,
    comments: nil,
    quantity: 0.0,
    unit_of_measure: nil,
    min: nil,
    sid: nil,
    esn: nil,
    imei: nil,
    market_id: nil,
    line_status: nil,
    base_price: 0.0,
    line_discount: 0.0,
    line_tax1: 0.0,
    line_tax2: 0.0,
    line_tax3: 0.0,
    ship_date: nil,
    failure_date: nil,
    failure_description: nil
  }


  def line_no
    @element[:line_no]
  end

  def line_no=(num)
    @element[:line_no] = num
  end

  def defaults
    DEFAULTS
  end

end

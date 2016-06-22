class IngramMicro::ReturnOrderHeader < IngramMicro::BaseElement

  DEFAULTS = {
    customer_order_number: nil,
    brightpoint_order_number: nil,
    order_reference: nil,
    customer_order_date: nil,
    order_sub_total: 0.0 ,
    order_discount: 0.0,
    order_tax1: 0.0,
    order_tax2: 0.0,
    order_tax3: 0.0,
    order_shipment_charge: 0.0 ,
    order_total_net: 0.0 ,
    order_status: nil,
    order_type: nil,
    return_request_expiration_date: nil
  }

  def defaults
    DEFAULTS
  end

  def use_current_date?
    if @element[:customer_order_date].nil?
      @element[:customer_order_date] = DateTime.now.strftime("%Y%m%d")
    end
  end
end

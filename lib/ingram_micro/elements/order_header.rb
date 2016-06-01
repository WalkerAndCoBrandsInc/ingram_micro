class IngramMicro::OrderHeader < IngramMicro::BaseElement

  DEFAULTS = {
    customer_order_number: 0,
    customer_order_date: nil,
    order_sub_total: 0.0,
    order_discount: 0.0,
    order_tax1: 0.0,
    order_tax2: 0.0,
    order_tax3: 0.0,
    order_shipment_charge: 0.0,
    order_total_net: 0.0,
    order_status: nil,
    order_type: nil,
    gift_flag: nil
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

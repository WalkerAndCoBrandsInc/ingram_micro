class IngramMicro::InboundOrderHeader < IngramMicro::InboundBaseElement

  def customer_order_number
    hash['customer_order_number']
  end

  def customer_order_date
    hash['customer_order_date']
  end

  def order_sub_total
    hash['order_sub_total']
  end

  def order_discount
    hash['order_discount']
  end

  def order_tax1
    hash['order_tax1']
  end

  def order_tax2
    hash['order_tax2']
  end

  def order_tax3
    hash['order_tax3']
  end

  def order_shipment_charge
    hash['order_shipment_charge']
  end

  def order_total_net
    hash['order_total_net']
  end

  def order_status
    hash['order_status']
  end

  def order_type
    hash['order_type']
  end

  def brightpoint_order_number
    hash['brightpoint_order_number']
  end

  def warehouse_id
    hash['warehouse_id']
  end

  def ship_date
    hash['ship_date']
  end

  def order_reference
    hash['order_reference']
  end

  def gift_flag
    hash['gift_flag']
  end

end

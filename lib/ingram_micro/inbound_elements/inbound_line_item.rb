class IngramMicro::InboundLineItem < IngramMicro::InboundBaseElement

  def base_price
    hash['base_price']
  end

  def bill_of_lading
    hash['bill_of_lading']
  end

  def container_id
    hash['container_id']
  end

  def comments
    hash['comments']
  end

  def customer_order_date
    hash['customer_order_date']
  end

  def line_discount
    hash['line_discount']
  end

  def line_tax1
    hash['line_tax1']
  end

  def line_tax2
    hash['line_tax2']
  end

  def line_tax3
    hash['line_tax3']
  end

  def serial_numbers
    if hash['serial_list']
      serial_numbers_hash = hash['serial_list']['serial_numbers']
      IngramMicro::SerialNumbers.new(serial_numbers_hash)
    end
  end

  def item_code
    hash['item_code']
  end

  def line_no
    hash['line_no']
  end

  def line_reference
    hash['line_reference']
  end

  def line_status
    hash['line_status'] || ''
  end

  def brightpoint_line_no
    hash['brightpoint_line_no']
  end

  def market_id
    hash['market_id']
  end

  def pallet_id
    hash['pallet_id']
  end

  def product_name
    hash['product_name']
  end

  def quantity
    hash['quantity']
  end

  def backorder_quantity
    hash['backorder_quantity']
  end

  def scac
    hash['scac']
  end

  def ship_quantity
    hash['ship_quantity']
  end

  def special_message
    hash['special_message']
  end

  def unit_of_measure
    hash['unit_of_measure']
  end

  def universal_product_code
    hash['universal_product_code']
  end

end

class IngramMicro::SalesOrderSuccess < IngramMicro::InboundBaseElement

  def customer_id
    hash['message']['sales_order_success']['header']['customer_id']
  end

  def shipment_information
    shipment_information_hash = hash['message']['sales_order_success']['header']['shipment_information']
    IngramMicro::InboundShipmentInformation.new(shipment_information_hash)
  end

  def purchase_order_information
    purchase_order_information_hash = hash['message']['sales_order_success']['header']['purchase_order_information']
    IngramMicro::InboundPurchaseOrderInformation.new(purchase_order_information_hash)
  end

  def order_header
    order_header_hash = hash['message']['sales_order_success']['header']['order_header']
    IngramMicro::InboundOrderHeader.new(order_header_hash)
  end

  def detail
    detail_hash = hash['message']['sales_order_success']['detail']
    IngramMicro::InboundDetail.new(detail_hash)
  end

end

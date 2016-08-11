class IngramMicro::InventorySyncLineItem < IngramMicro::InboundBaseElement

  def line_no
    hash['line_no'].to_i
  end

  def transaction_document_number
    hash['transaction_document_number']
  end

  def item_code
    hash['item_code']
  end

  def universal_product_code
    hash['universal_product_code'].to_i
  end

  def warehouse_id
    hash['warehouse_id']
  end

  def unit_of_measure
    hash['unit_of_measure']
  end

  def quantity_on_hand
    hash['quantity_on_hand'].to_i
  end

  def quantity_committed
    hash['quantity_committed'].to_i
  end

  def quantity_available
    hash['quantity_available'].to_i
  end

  def quantity_on_back_order
    hash['quantity_on_back_order'].to_i
  end

  def synchronization_timestamp
    hash['synchronization_timestamp'].to_i
  end

end

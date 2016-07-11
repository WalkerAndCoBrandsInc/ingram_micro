class IngramMicro::InboundPurchaseOrderInformation < IngramMicro::InboundBaseElement

  def purchase_order_number
    hash['purchase_order_number']
  end

  def account_description
    hash['account_description']
  end

  def purchase_order_amount
    hash['purchase_order_amount']
  end

  def currency_code
    hash['currency_code']
  end

  def comments
    hash['comments']
  end

end

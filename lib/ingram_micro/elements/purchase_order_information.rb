class IngramMicro::PurchaseOrderInformation < IngramMicro::BaseElement

  DEFAULTS = {
    purchase_order_number: nil,
    account_description: nil,
    purchase_order_amount: 0.0,
    purchase_order_event: nil,
    currency_code: nil,
    comments: nil
  }

  def defaults
    DEFAULTS
  end
end

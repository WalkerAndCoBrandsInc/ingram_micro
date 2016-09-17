class IngramMicro::OutboundPurchaseOrderInformation < IngramMicro::BaseElement
  DEFAULTS = {
    purchase_order_number: nil,
    account_description: nil,
    purchase_order_amount: 0.0,
    purchase_order_event: nil,
    currency_code: nil,
    comments: nil
  }.freeze

  def initialize(options = {})
    super(options)

    # customer_id is always set by BaseElement, but we don't need it here
    self.element.delete(:customer_id)
  end

  def defaults
    DEFAULTS
  end
end

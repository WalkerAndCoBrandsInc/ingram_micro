class IngramMicro::ReturnReceipt < IngramMicro::InboundBaseElement
  def message_id
    @hash["message"]["message_header"]["message_id"]
  end

  def purchase_order_information
    IngramMicro::InboundPurchaseOrderInformation.new(
      @hash["message"]["return-receipt"]["header"]["purchase_order_information"]
    )
  end

  def purchase_order_number
    purchase_order_information.purchase_order_number
  end
end

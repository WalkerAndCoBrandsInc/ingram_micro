class IngramMicro::InventorySync < IngramMicro::InboundBaseElement

  def message_header
    @hash['message']['message_header']
  end

  def inventory_status
    @hash['message']['inventory_synchronization']
  end

  def details
    @hash['message']['inventory_synchronization']['details']['line_item']
  end

end

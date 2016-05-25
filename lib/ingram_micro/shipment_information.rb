class IngramMicro::ShipmentInformation < IngramMicro::Customer

  attr_accessor :ship_via, :ship_request_date, :ship_request_from,
    :ship_request_warehouse

  def build(builder)
    super(builder, "ship")
    builder.send("ship-via", ship_via)
    builder.send("ship-request-date", ship_request_date)
    builder.send("ship-request-from", ship_request_from)
    builder.send("ship-request-warehouse", ship_request_warehouse)
  end
end

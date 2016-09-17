module IngramMicro
  class SalesOrderShipmentInformation < OutboundShipmentInformation
    DEFAULTS = DEFAULTS.merge(
      ship_no_later: nil,
      no_ship_before: nil,
      dock_date: nil,
      ship_to_code: nil
    )
  end
end

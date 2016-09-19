module IngramMicro
  class SalesOrderShipmentInformation < OutboundShipmentInformation
    # NOTE, the order of keys matters when doing XSD validations.
    DEFAULTS = DEFAULTS.merge(
      ship_no_later:  nil,
      no_ship_before: nil,
      dock_date:      nil,
      ship_to_code:   nil
    )
  end
end

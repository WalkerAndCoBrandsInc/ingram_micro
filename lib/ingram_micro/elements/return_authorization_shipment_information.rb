module IngramMicro
  class ReturnAuthorizationShipmentInformation < BaseElement
    DEFAULTS = IngramMicro::OutboundShipmentInformation::DEFAULTS

    def defaults
      DEFAULTS
    end

    def valid_shipping_methods?
      shipping_method = element[:ship_via]
      !!(::IngramMicro::SHIPPING_METHODS[shipping_method])
    end

    def shipping_method_name
      if valid_shipping_methods?
        ::IngramMicro::SHIPPING_METHODS[element[:ship_via]]
      else
        'Invalid shipping code'
      end
    end

    def build(builder)
      add_ship_address2
      super(builder)
    end

    def add_ship_address2
      element[:ship_address2] = ' ' unless element[:ship_address2]
    end

    def valid?
      true
    end
  end
end

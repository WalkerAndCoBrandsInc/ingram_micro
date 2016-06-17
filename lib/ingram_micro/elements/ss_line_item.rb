class IngramMicro::ShipmentStatusLineItem < IngramMicro::BaseElement

  DEFAULTS = {
    :line_no => nil,
    :transaction_document_number => nil,
    :bill_of_lading => nil,
    :customer_order_number => nil,
    :brightpoint_order_number =>  nil,
    :status_code => nil,
    :status_date => nil,
    :reason_code => nil,
    :signed_by => nil,
    :status_timestamp => nil,
    :comments => nil
  }

  def line_no
    @element[:line_no]
  end

  def line_no=(num)
    @element[:line_no] = num
  end

  def defaults
    DEFAULTS
  end

end

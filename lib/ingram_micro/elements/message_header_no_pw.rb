class IngramMicro::MessageHeaderNoPW < IngramMicro::BaseElement

  DEFAULTS = {
    message_id: 0,
    transaction_name: nil,
    partner_name: nil,
    source_url: nil,
    create_timestamp: nil,
    response_request: 1
  }

  def defaults
    DEFAULTS
  end

end
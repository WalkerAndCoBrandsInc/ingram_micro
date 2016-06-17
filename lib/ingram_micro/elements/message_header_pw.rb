class IngramMicro::MessageHeaderPW < IngramMicro::BaseElement

  DEFAULTS = {
    message_id: 0,
    transaction_name: nil,
    partner_name: nil,
    partner_password: nil,
    source_url: nil,
    create_timestamp: nil,
    response_request: 1
  }

  def defaults
    DEFAULTS
  end
end

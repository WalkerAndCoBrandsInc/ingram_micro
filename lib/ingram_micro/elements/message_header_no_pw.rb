class IngramMicro::MessageHeaderNoPW < IngramMicro::BaseElement

  DEFAULTS = {
    message_id: 0,
    transaction_name: nil,
    partner_name: nil,
    source_url: nil,
    create_timestamp: nil,
    response_request: 1
  }

  format :create_timestamp, IngramMicro::DateTimeFormatter.new

  def defaults
    DEFAULTS
  end

  def valid?
    raise IngramMicro::InvalidType.new('message_id must be a number') unless integer?(@element[:message_id])
    raise IngramMicro::MissingField.new('partner_name must be present') unless @element[:partner_name]
    true
  end
end

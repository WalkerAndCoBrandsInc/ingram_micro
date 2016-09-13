class IngramMicro::MessageStatus < IngramMicro::BaseElement
  DEFAULTS = {
    status_code: nil,
    status_description: nil,
    comments: nil,
    response_timestamp: nil,
    filename: nil
  }.freeze

  def defaults
    DEFAULTS
  end

  def initialize(options={})
    super
    @element[:response_timestamp] ||= Time.now.strftime('%Y%m%d%H%M%S')
  end

end

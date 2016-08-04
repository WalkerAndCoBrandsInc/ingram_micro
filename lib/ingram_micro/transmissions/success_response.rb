class IngramMicro::SuccessResponse < IngramMicro::StandardResponse
  DESCRIPTION = "Message Success"

  def initialize(options={})
    options[:status_code] = 0
    options[:status_description] = DESCRIPTION
    super(options)
  end
end
class IngramMicro::FailureResponse < IngramMicro::StandardResponse
  DESCRIPTION = "Message Failure"

  def initialize(options={})
    options[:status_code] = -1
    options[:status_description] = DESCRIPTION
    super(options)
  end
end
class IngramMicro::RequestProcessor
  attr_accessor :body_xml

  def initialize(request)
    @body_xml = Nokogiri::XML(request.body.read).to_xml
  end

  def hashify
    Hash.from_xml(@body_xml)
  end

end

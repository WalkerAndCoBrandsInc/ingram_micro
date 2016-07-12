class IngramMicro::RequestProcessor
  require 'nori'
  attr_accessor :body_xml

  def initialize(request)
    @body_xml = Nokogiri::XML(request.body.read).to_xml
  end

  def hashify
    Nori.new.parse(@body_xml)
  end
end

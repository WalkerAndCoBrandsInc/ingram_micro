class IngramMicro::RequestProcessor
  require 'xmlsimple'
  attr_accessor :body_xml

  def initialize(request)
    @body_xml = Nokogiri::XML(request.body.read).to_xml
  end

  def hashify
    XmlSimple.xml_in(@body_xml)
  end
end

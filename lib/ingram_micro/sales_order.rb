class IngramMicro::SalesOrder
  def initialize
  end

  def build
    @builder = Nokogiri::XML::Builder.new do |xml|
      xml.message do
        xml.send("message-header") do
          xml.send "message-id", 123
          xml.send "transaction-name", "sales-order-submission"
          xml.send "partner-name", IngramMicro.configuration.partner_name
          xml.send "partner-password", IngramMicro.configuration.partner_password
          xml.send "source-url", IngramMicro.configuration.source_url
        end
      end
    end
  end
end

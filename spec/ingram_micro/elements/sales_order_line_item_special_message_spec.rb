require 'spec_helper'

describe IngramMicro::SalesOrderLineItemSpecialMessage do
  context 'without any information passed in' do
    it "produces a 'special-message' xml field" do
      special_message = described_class.new
      builder = Nokogiri::XML::Builder.new

      expect(special_message.build(builder)).to be_truthy
      expect(builder.to_xml).to include("<special-message/>")
    end
  end

  context 'with information passed in' do
    let(:message_options) {
      {
        engraving_font: 'hellavetica',
        engraving_location: 'Santa Cruz',
        special_message1: 'duuuude'
      }
    }
    let(:message) { described_class.new(message_options) }

    it 'sets the fields accordingly' do
      expect(message.element[:engraving_font]).to eq("hellavetica")
      expect(message.element[:special_message1]).to eq("duuuude")
      expect(message.element[:special_message4]).to be nil
    end

    it 'creates xml properly' do
      builder = Nokogiri::XML::Builder.new
      message.build(builder)

      expect(builder.to_xml).to include('<engraving-font>hellavetica')
      expect(builder.to_xml).to include('<special-message1>duuuude')
      expect(builder.to_xml).to_not include('<special-message4>')
    end
  end
end
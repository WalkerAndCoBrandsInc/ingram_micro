require 'spec_helper'

describe IngramMicro::SalesOrderLineItemNameValue do
  let(:builder) { Nokogiri::XML::Builder.new }

  describe '#self. build' do

    it 'allows attributes to be passed in' do
      linv = described_class.new(warranty_item: 'true')

      expect do
        builder.send('message') do
          linv.build(builder)
        end
      end.to_not raise_error
    end

    it 'properly creates xml' do
      test_builder = Nokogiri::XML::Builder.new
      linv = described_class.new(
        international_eccn_value: '30.00',
        hts_code: '42'
      )
      test_builder.send('line-item') do
        linv.build(test_builder)
      end

      expect(test_builder.to_xml).to include('<line-attribute-name>international-eccn-value')
      expect(test_builder.to_xml).to include('<line-attribute-value>42')
    end
  end

end

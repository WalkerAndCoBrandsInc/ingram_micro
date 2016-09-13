require 'spec_helper'

describe IngramMicro::SalesOrderLineItemNameValue do
  let(:builder) { Nokogiri::XML::Builder.new }

  describe '#self. build' do

    it 'raises an error with an invalid attribute name passed in' do
      name, value = 'Joseph', 'is the best'
      linv = described_class.new(name: name, value: value)
      expect{linv.build(builder)}.to raise_error(ArgumentError)
    end

    it 'works fine with a valid attribute name' do
      name, value = 'warranty-item', 'true'
      linv = described_class.new(name: name, value: value)

      expect{linv.build(builder)}.to_not raise_error
    end

    it 'properly creates xml' do
      test_builder = Nokogiri::XML::Builder.new
      linv1 = described_class.new(name: 'international-eccn-value', value: '30.00')
      linv2 = described_class.new(name: 'hts-code', value: '42')
      test_builder.send('line-item') do
        linv1.build(test_builder)
        linv2.build(test_builder)
      end

      expect(test_builder.to_xml).to include('<line-attribute-name>international-eccn-value')
      expect(test_builder.to_xml).to include('<line-attribute-value>42')
    end
  end

end
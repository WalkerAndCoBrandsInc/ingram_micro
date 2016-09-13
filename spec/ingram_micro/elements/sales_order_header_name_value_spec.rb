require 'spec_helper'

describe IngramMicro::SalesOrderHeaderNameValue do
  describe '#build' do
    let(:builder) { Nokogiri::XML::Builder.new }
    context 'with invalid names passed in' do
      bad_names = described_class.new(name: 'blah', value: 'blah')

      it 'raises an error' do
        expect{bad_names.build(builder)}.to raise_error(ArgumentError)
      end
    end

    context 'with valid name passed in' do
      good_name = "international-importer-of-record-city"
      good_name_value = described_class.new(name: good_name, value: 'Amsterdam')
      it 'successfully passes in values' do
        expect{good_name_value.build(builder)}.to_not raise_error
      end
      it 'creates the correct xml elements' do
        good_name_value.build(builder)
        expect(builder.to_xml).to include('<attribute-name>international-importer-of-record-city')
        expect(builder.to_xml).to include('<attribute-value>Amsterdam</attribute-value>')
      end
    end
  end
end

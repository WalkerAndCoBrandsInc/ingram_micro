require 'spec_helper'

describe IngramMicro::SalesOrderHeaderNameValue do
  describe '#build' do

    context 'with valid name passed in' do
      good_name_value = described_class.new(international_importer_of_record_city: "Amsterdam")

      it 'successfully passes in values' do
        builder = Nokogiri::XML::Builder.new
        expect do
          builder.send('message') do
            good_name_value.build(builder)
          end
        end.to_not raise_error
      end

      it 'creates the correct xml elements' do
        builder = Nokogiri::XML::Builder.new
        builder.send('message') do
          good_name_value.build(builder)
        end

        expect(builder.to_xml).to include('<attribute-name>international-importer-of-record-city')
        expect(builder.to_xml).to include('<attribute-value>Amsterdam</attribute-value>')
      end
    end
  end
end

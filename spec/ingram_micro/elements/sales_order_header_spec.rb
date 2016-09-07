require 'spec_helper'

describe IngramMicro::SalesOrderHeader do
  describe "#build" do
    it 'formats the customer_order_date as YYYYMMDD' do
      Nokogiri::XML::Builder.new do |builder|
        builder.send('message') do
          IngramMicro::SalesOrderHeader.new(
          customer_order_date: Time.new(2016, 6, 15)
          ).build(builder)
        end

        expect(builder.to_xml).to include('<customer-order-date>20160615</customer-order-date>')
      end
    end

    it 'defaults the customer_order_date to empty if it is not passed' do
      Nokogiri::XML::Builder.new do |builder|
        builder.send('message') do
          IngramMicro::SalesOrderHeader.new.build(builder)
        end

        expect(builder.to_xml).to include('<customer-order-date/>')
      end
    end

    it 'also accepts a string for customer_order_date' do
      Nokogiri::XML::Builder.new do |builder|
        builder.send('message') do
          IngramMicro::SalesOrderHeader.new(
          customer_order_date: '20160615'
          ).build(builder)
        end

        expect(builder.to_xml).to include('<customer-order-date>20160615</customer-order-date>')
      end
    end
  end

  describe "#add_header_name_values" do
    it 'allows header-name-value to be passed in' do
      soh_options = {
        customer_order_number: 2083648614,
        order_total_net: 39.46,
        header_name_value: [["international-importer-of-record-email", "email@canada.ca"]]
      }
      soh_builder = Nokogiri::XML::Builder.new do |builder|
        builder.send('message') do
          IngramMicro::SalesOrderHeader.new(soh_options).build(builder)
        end
      end

      expect(soh_builder.to_xml).to include('<header-name-value>')
      expect(soh_builder.to_xml).to include('<attribute-name>international-importer-of-record-email')
      expect(soh_builder.to_xml).to include('<attribute-value>email@canada.ca')
    end
  end
end

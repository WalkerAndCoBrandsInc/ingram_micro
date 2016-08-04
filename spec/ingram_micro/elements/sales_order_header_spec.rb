require 'spec_helper'

describe IngramMicro::SalesOrderHeader do
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

require 'spec_helper'

describe IngramMicro::SalesOrder do

  let(:empty_sales_order) { IngramMicro::SalesOrder.new({parner_name: 'empty'}) }

  let(:order_header_options) {{
    cutomer_order_number: '355658',
    order_sub_total: '29.95',
    order_shipment_charge: 6.95,
    order_total_net: 36.90
  }}

  let(:customer) { FactoryGirl.build(:customer)}
  let(:shipment_information) { FactoryGirl.build(:shipment_information) }
  let(:credit_card_information) { FactoryGirl.build(:credit_card_information) }
  let(:order_header) { IngramMicro::SalesOrderHeader.new(order_header_options)}
  let(:line_item) { FactoryGirl.build(:sales_order_line_item) }
  let(:detail) { IngramMicro::Detail.new(line_items: [line_item])}
  let(:sales_order_options) {{
    carrier_name: 'a carrier name',
    business_name: 'Nguyen & Sedano Inc',
    customer_id: '42',
    customer: customer,
    credit_card_information: credit_card_information,
    order_header: order_header,
    shipment_information: shipment_information,
    detail: detail
    }}

  let(:populated_sales_order) { IngramMicro::SalesOrder.new(sales_order_options) }

  describe '#initialize' do
    context 'with no data passed in' do
      it 'should still create a valid SalesOrder object' do
        expect(empty_sales_order).to be_truthy
      end
    end
    context 'with data passed in' do
      it 'should create a valid SalesOrder object with the data passed in' do
        expect(populated_sales_order).to be_truthy
      end
    end
  end

  describe '#build' do
    context 'with no data passed into SalesOrder object' do
      it 'raises an error' do
        expect{empty_sales_order.schema_valid?}.to raise_error(Exception)
      end
    end
    context 'with data passed in' do
      it 'should create an xml form' do
        expect(populated_sales_order.order_builder).to be_truthy
      end
    end
  end

  describe '#schema_valid?' do
    context 'with no data passed into SalesOrder object' do
      it 'raises an error' do
        expect{empty_sales_order.schema_valid?}.to raise_error(Exception)
      end
    end
    context 'with data passed in' do
      it 'validates output xml using SalesOrder schema' do
        expect(populated_sales_order.schema_valid?).to be true
      end
    end
  end

  describe 'order_builder' do
    context 'empty sales order' do
      it 'raises an error' do
        expect{empty_sales_order.schema_valid?}.to raise_error(Exception)
      end
    end

    context 'populated sales order' do
      it 'generates xml' do
        expected_xml = File.read(IngramMicro::GEM_DIR + 'spec/output_xmls/populated_sales_order.xml')
        expect(populated_sales_order.order_builder.to_xml).to eq expected_xml

        hash_from_xml = Hash.from_xml(populated_sales_order.order_builder.to_xml)
        expect(hash_from_xml['message']['message_header']['transaction_name']).to eq 'sales-order-submission'
      end
    end
  end
end

require 'spec_helper'
describe IngramMicro::SalesOrder do

  let(:empty_sales_order) { IngramMicro::SalesOrder.new({partner_name: Faker::Company.name}) }
  let(:populated_sales_order) { Fabricate.build(:sales_order) }

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
    context 'with sales order shipment information' do
      let(:sales_order_shipment_information) { Fabricate.build(:sales_order_shipment_information) }
      it 'sets the attribute' do
        sales_order = IngramMicro::SalesOrder.new({sales_order_shipment_information: sales_order_shipment_information})
        expect(sales_order.sales_order_shipment_information).to eq(sales_order_shipment_information)
      end
    end

    context 'with purchase order information' do
      let(:sales_order_purchase_order_information) { Fabricate.build(:sales_order_purchase_order_information) }
      it 'sets the attribute' do
        sales_order = IngramMicro::SalesOrder.new({purchase_order_information: sales_order_purchase_order_information})
        expect(sales_order.purchase_order_information).to eq(sales_order_purchase_order_information)
      end
    end

    context 'old options passed in' do
      it 'raises for shipment information' do
        expect do
          IngramMicro::SalesOrder.new({shipment_information: Fabricate.build(:sales_order_shipment_information)})
        end.to raise_error(/sales_order_shipment_information/)
      end

      it 'raises for order header' do
        expect do
          IngramMicro::SalesOrder.new({order_header: Fabricate.build(:sales_order_header)})
        end.to raise_error(/sales_order_header/)
      end
    end
  end

  context "configured for domestic shipping" do

    before(:each) do
      IngramMicro.configure do |config|
        config.international = false
      end
    end

    describe '#schema_valid?' do
      context 'with data passed in' do
        it 'validates output xml using SalesOrder schema' do
          expect(populated_sales_order.schema_valid?).to be true
        end
      end
    end

    describe 'xml_builder' do
      context 'populated sales order' do
        it 'generates xml' do
          expect(populated_sales_order.xml_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'sales-order-submission')
        end
      end

      context 'passed shipment information' do
        let(:ship_first_name) { populated_sales_order.sales_order_shipment_information.element[:ship_first_name] }
        before do
          expect(ship_first_name).to_not be_nil
        end

        it 'includes it in xml' do
          expect(populated_sales_order.xml_builder.to_xml).to have_xml('/message/sales-order-submission/header/shipment-information/ship-first-name', ship_first_name)
        end
      end
    end

    describe 'order_builder' do
      it 'warns for deprecation and calls xml_builder' do
        expect(populated_sales_order).to receive(:warn).with('[DEPRECATION] `order_builder` is deprecated.  Please use `xml_builder` instead.')
          expect(populated_sales_order.order_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'sales-order-submission')
      end
    end
  end

  context "configured for international shipping" do

    before(:each) do
      IngramMicro.configure do |config|
        config.international = true
      end
    end

    let!(:international_sales_order) { Fabricate.build(:sales_order_international) }

    describe '#schema_valid?' do
      context 'with data passed in' do
        it 'validates output xml using SalesOrder schema' do
          expect(international_sales_order.schema_valid?).to be true
        end
      end
    end

    describe 'xml_builder' do
      context 'populated sales order' do
        it 'generates xml' do
          expect(international_sales_order.xml_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'sales-order-submission')
        end
      end

      context 'passed shipment information' do
        let(:ship_first_name) { international_sales_order.sales_order_shipment_information.element[:ship_first_name] }
        before do
          expect(ship_first_name).to_not be_nil
        end

        it 'includes it in xml' do
          expect(international_sales_order.xml_builder.to_xml).to have_xml('/message/sales-order-submission/header/shipment-information/ship-first-name', ship_first_name)
        end
      end
    end

    describe 'order_builder' do
      it 'warns for deprecation and calls xml_builder' do
        expect(international_sales_order).to receive(:warn).with('[DEPRECATION] `order_builder` is deprecated.  Please use `xml_builder` instead.')
          expect(international_sales_order.order_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'sales-order-submission')
      end
    end
  end

end

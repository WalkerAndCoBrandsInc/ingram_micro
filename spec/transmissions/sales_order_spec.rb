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
  end

  describe '#build' do
    context 'with data passed in' do
      it 'should create an xml form' do
        expect(populated_sales_order.order_builder).to be_truthy
      end
    end
  end

  describe '#schema_valid?' do
    context 'with data passed in' do
      it 'validates output xml using SalesOrder schema' do
        expect(populated_sales_order.schema_valid?).to be true
      end
    end
  end

  describe 'order_builder' do
    context 'populated sales order' do
      it 'generates xml' do
        expect(populated_sales_order.order_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'sales-order-submission')
      end
    end
  end
end

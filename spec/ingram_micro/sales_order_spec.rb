require 'spec_helper'

describe IngramMicro::SalesOrder do

  let(:empty_sales_order) { IngramMicro::SalesOrder.new }

  let(:order_header_options) {{
    cutomer_order_number: "355658",
    order_sub_total: "29.95",
    order_shipment_charge: 6.95,
    order_total_net: 36.90
  }}

  let(:customer) { FactoryGirl.create(:customer)}
  let(:shipment_information) { FactoryGirl.create(:shipment_information) }
  let(:credit_card_information) { FactoryGirl.create(:credit_card_information) }
  let(:order_header) { IngramMicro::SalesOrderHeader.new(order_header_options)}
  let(:line_item) { FactoryGirl.create(:sales_order_line_item) }
  let(:detail) { IngramMicro::Detail.new(line_items: [line_item])}
  let(:sales_order_options) {{
    customer: customer,
    credit_card_information: credit_card_information,
    order_header: order_header,
    shipment_information: shipment_information,
    detail: detail
    }}

  let(:sales_order_with_info) { IngramMicro::SalesOrder.new(sales_order_options) }

  describe "#initialize" do
    context "with no data passed in" do
      it "should still create a valid SalesOrder object" do
        expect(empty_sales_order).to be_truthy
      end
    end
    context "with data passed in" do
      it "should create a valid SalesOrder object with the data passed in" do
        expect(sales_order_with_info).to be_truthy
      end
    end
  end

  describe "#build" do
    context "with no data passed into SalesOrder object" do
      it "should create an xml form" do
        expect(empty_sales_order.order_builder).to be_truthy
      end
    end
    context "with data passed in" do
      it "should create an xml form" do
        expect(sales_order_with_info.order_builder).to be_truthy
      end
    end
  end

  describe "#valid?" do
    context "with no data passed into SalesOrder object" do
      it "checks xml output against the SalesOrder schema" do
        expect(empty_sales_order.valid?).to be true
      end
    end
    context "with data passed in" do
      it "validates output xml using SalesOrder schema" do
        expect(sales_order_with_info.valid?).to be true
      end
    end
  end

  describe "#submit_request" do
    context "with no data passed into SalesOrder object" do
      it "valides and submits xml via HTTP POST request" do
        expect(empty_sales_order.submit_request).to be_truthy
      end
    end
    context "with data passed in" do
      it "validates and submits xml via HTTP POST request" do
        expect(sales_order_with_info.submit_request).to be_truthy
      end
    end
  end
end

require 'spec_helper'

describe IngramMicro::SalesOrder do
  describe "#build" do

    # binding.pry
  end

  describe "#valid?" do
    # validates against xsd
    # gives useful errors, extract some stuff to super class

    let(:customer) { IngramMicro::Customer.new }
    let(:shipment_information) { IngramMicro::ShipmentInformation.new }
    let(:credit_card_information) { IngramMicro::CreditCardInformation.new }
    let(:order_header) { IngramMicro::OrderHeader.new({order_sub_total: 25.8}) }
    let(:detail) { IngramMicro::SalesOrderDetail.new({line_items: [line_item_1, line_item_2]}) }
    let(:line_item_1) { IngramMicro::SalesOrderLineItem.new }
    let(:line_item_2) { IngramMicro::SalesOrderLineItem.new }
    # let(:message_header) { IngramMicro::MessageHeader.new }
    let(:options) { {
      customer: customer,
      shipment_information: shipment_information,
      credit_card_information: credit_card_information,
      order_header: order_header,
      detail: detail} }
    let(:sales_order) { IngramMicro::SalesOrder.new(options)}

    # context "the sample xml doesn't suck" do
    #   it "passes the schema" do
    #     expect(sales_order.schema_valid?).to be_truthy
    #   end
    # end

    context "a sales order with all components set" do
      before do
        customer.first_name = "John"
        customer.last_name = "Doe"
        customer.email = "jd@lame.com"
      end

      it "is true" do
        expect(sales_order.valid?).to be_truthy
      end
    end
  end
end

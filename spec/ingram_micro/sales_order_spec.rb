require 'spec_helper'

describe IngramMicro::SalesOrder do

  let(:empty_sales_order) { IngramMicro::SalesOrder.new }

  let(:customer_options) { {
    customer_first_name: "Tom",
    customer_last_name: "Haverford",
    customer_address1: "4715 Sebastian Ln",
    customer_city: "Pawnee",
    customer_state: "IN",
    customer_post_code: "62558",
    customer_phone1: "812-688-2473",
    customer_email: "tommyh@pawnee.in.gov"
    }
  }
  let(:shipment_options) {{
    ship_first_name: "Tom",
    ship_last_name: "Haverford",
    ship_address1: "4715 Sebastian Ln",
    ship_city: "Pawnee",
    ship_state: "IN",
    ship_post_code: "62558",
    ship_phone1: "812-688-2473",
    ship_email: "tommyh@pawnee.in.gov"
  }}
  let(:credit_card_options) {{
    credit_card_number: "5555789654123434",
    credit_card_expiration_date: "201706",
    credit_card_identification: "943",
    card_holder_name: "Tom Haverford",
    card_holder_address1: "4715 Sebastian Ln",
    card_holder_city: "Pawnee",
    card_holder_state: "IN",
    card_holder_post_code: "62558",
    card_holder_country_code: "US"
  }}
  let(:order_header_options) {{
    cutomer_order_number: "355658",
    order_sub_total: "29.95",
    order_shipment_charge: 6.95,
    order_total_net: 36.90
  }}
  let(:line_item_options) {{
    line_no: "BSKSB188530",
    product_name: "Bevel Shave Kit Start Bundle",
    quantity: 1.0,
    unit_of_measure: "Each",
    base_price: 29.95,
    line_tax1: 0.0,
    }}

    let(:customer) { IngramMicro::Customer.new(customer_options)}
    let(:shipment_information) { IngramMicro::ShipmentInformation.new(shipment_options)}
    let(:credit_card_information) { IngramMicro::CreditCardInformation.new(credit_card_options)}
    let(:order_header) { IngramMicro::SalesOrderHeader.new(order_header_options)}
    let(:line_item) { IngramMicro::SalesOrderLineItem.new(line_item_options)}
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
      it "valides and submits xml via HTTP POST request" do
        expect(sales_order_with_info.submit_request).to be_truthy
      end
    end
  end
end

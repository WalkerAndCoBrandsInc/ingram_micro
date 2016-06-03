require 'spec_helper'

describe IngramMicro::ReturnAuthorization do

  let(:ra_no_info) { IngramMicro::ReturnAuthorization.new }

  let(:customer_options) { {
    customer_first_name: "Frank",
    customer_last_name: "Castle",
    customer_address1: "2815 Punisher Alley",
    customer_city: "New York",
    customer_state: "NY",
    customer_post_code: "10001",
    customer_phone1: "212-451-3718",
    customer_email: "francis.castiglione@usmc.mil"
    } }

  let(:shipment_options) { {
    ship_first_name: "Frank",
    ship_last_name: "Castle",
    ship_address1: "2815 Punisher Alley",
    ship_city: "New York",
    ship_state: "NY",
    ship_post_code: "10001",
    ship_phone1: "212-451-3718",
    ship_email: "francis.castiglione@usmc.mil"
    } }

  let(:credit_card_options) { {
    credit_card_number: "4471834566719702",
    credit_card_expiration_date: "202011",
    credit_card_identification: "871",
    card_holder_name: "Frank Castle",
    card_holder_address1: "2815 Cold Blood Ln",
    card_holder_city: "Hoboken",
    card_holder_state: "NJ",
    card_holder_post_code: "07030",
    card_holder_country_code: "US"
    } }

  let(:order_header_options) {{
    customer_order_number: "37159B",
    order_sub_total: 2150.00,
    order_shipment_charge: 28.72,
    order_total_net: 2178.72
    }}

  let(:line_item_options) {{
    line_no: "AR15X15",
    product_name: "AR-15 Assault Rifle",
    quantity: 1.0,
    unit_of_measure: "Each",
    base_price: 2150.00,
    line_tax1: 0.0,
    }}

  let(:customer) { IngramMicro::Customer.new(customer_options)}
  let(:shipment_information) { IngramMicro::ShipmentInformation.new(shipment_options)}
  let(:credit_card_information) { IngramMicro::CreditCardInformation.new(credit_card_options)}
  let(:order_header) { IngramMicro::ReturnOrderHeader.new(order_header_options)}
  let(:line_item) { IngramMicro::ReturnAuthorizationLineItem.new(line_item_options)}
  let(:detail) { IngramMicro::Detail.new(line_items: [line_item])}

  let(:ra_options) {{
    customer: customer,
    credit_card_information: credit_card_information,
    order_header: order_header,
    shipment_information: shipment_information,
    detail: detail
    }}

  let(:return_auth_with_info) { IngramMicro::ReturnAuthorization.new(ra_options)}

  describe "#build" do
    context "without data passed in" do
      it "creates xml that passes the schema" do
        expect(ra_no_info.valid?).to be true
      end
    end

    context "with data entered" do
      it "creates xml that passes the schema" do
        expect(return_auth_with_info.valid?).to be true
      end
    end
  end

  describe "#submit_request" do
    it "validates xml and sends it to the specified endpoint" do
      expect(return_auth_with_info.submit_request).to be_truthy
    end
  end


end

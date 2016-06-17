require 'spec_helper'

describe IngramMicro::ReturnAuthorization do

  let(:ra_no_info) { IngramMicro::ReturnAuthorization.new }

  let(:order_header_options) {{
    customer_order_number: '37159B',
    order_sub_total: 89.85,
    order_shipment_charge: 6.95,
    order_total_net: 96.80
    }}

  let(:customer) { FactoryGirl.build(:customer) }
  let(:shipment_information) { FactoryGirl.build(:shipment_information) }
  let(:credit_card_information) { FactoryGirl.build(:credit_card_information) }
  let(:order_header) { IngramMicro::ReturnOrderHeader.new(order_header_options)}
  let(:line_item) { FactoryGirl.build(:return_authorization_line_item) }
  let(:detail) { IngramMicro::Detail.new(line_items: [line_item])}

  let(:ra_options) {{
    customer: customer,
    credit_card_information: credit_card_information,
    order_header: order_header,
    shipment_information: shipment_information,
    detail: detail
    }}

  let(:return_auth_with_info) { IngramMicro::ReturnAuthorization.new(ra_options)}

  describe '#build' do
    context 'without data passed in' do
      it 'creates xml that passes the schema' do
        expect(ra_no_info.valid?).to be true
      end
    end

    context 'with data entered' do
      it 'creates xml that passes the schema' do
        expect(return_auth_with_info.valid?).to be true
      end
    end
  end
end

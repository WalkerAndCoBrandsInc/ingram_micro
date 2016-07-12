require 'spec_helper'
require 'nori'

describe IngramMicro::ShipAdvice do

  let(:input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/ship_advice.xml') }
  let(:parser) { Nori.new }
  let(:hash_from_xml) { parser.parse(input_xml) }
  let(:ship_advice) { IngramMicro::ShipAdvice.new(hash_from_xml) }
  context 'processes normal ship advice' do

    it 'gets the customer id from received xml' do
      expect(ship_advice.customer_id).to eq '308524'
    end

    it 'generates shipment_information comparable to received xml' do
      expect(ship_advice.shipment_information.ship_first_name).to eq 'Joe'
      expect(ship_advice.shipment_information.ship_last_name).to eq 'Smith'
      expect(ship_advice.shipment_information.ship_address1).to eq '1 Main St'
      expect(ship_advice.shipment_information.ship_city).to eq 'Irvine'
      expect(ship_advice.shipment_information.ship_state).to eq 'CA'
      expect(ship_advice.shipment_information.ship_post_code).to eq '92606-0802'
      expect(ship_advice.shipment_information.ship_country_code).to eq 'US'
      expect(ship_advice.shipment_information.ship_phone1).to eq '555-555-5555'
      expect(ship_advice.shipment_information.ship_email).to eq 'Joe@gmail.com'
      expect(ship_advice.shipment_information.ship_via).to eq 'FX01'
      expect(ship_advice.shipment_information.ship_request_date).to eq '20100721'
      expect(ship_advice.shipment_information.ship_request_warehouse).to eq 'AW1'
    end

    it 'generates purchase_order_infromation comparable to received xml' do
      expect(ship_advice.purchase_order_information.purchase_order_number).to eq 'A544265594747685'
      expect(ship_advice.purchase_order_information.account_description).to be_nil
      expect(ship_advice.purchase_order_information.purchase_order_amount).to eq '0.0'
      expect(ship_advice.purchase_order_information.currency_code).to eq 'USD'
      expect(ship_advice.purchase_order_information.comments).to be_nil
    end

    it 'generates order_header information comparable to received xml' do
      expect(ship_advice.order_header.ship_date).to eq '20100722'
      expect(ship_advice.order_header.customer_order_number).to eq 'A544265594747685'
      expect(ship_advice.order_header.customer_order_date).to eq '20100721'
      expect(ship_advice.order_header.customer_order_number).to eq 'A544265594747685'
      expect(ship_advice.order_header.customer_order_date).to eq '20100721'
      expect(ship_advice.order_header.order_sub_total).to eq '609.0'
      expect(ship_advice.order_header.order_discount).to eq '0.0'
      expect(ship_advice.order_header.order_tax1).to eq '53.29'
      expect(ship_advice.order_header.order_tax2).to eq '0.0'
      expect(ship_advice.order_header.order_tax3).to eq '0.0'
      expect(ship_advice.order_header.order_shipment_charge).to eq '0.0'
      expect(ship_advice.order_header.order_total_net).to eq '0.0'
      expect(ship_advice.order_header.order_status).to eq 'Completed'
      expect(ship_advice.order_header.order_type).to be_nil
      expect(ship_advice.order_header.brightpoint_order_number).to eq '37049062'
      expect(ship_advice.order_header.warehouse_id).to eq 'AW1'
      expect(ship_advice.order_header.ship_date).to eq '20100722'
    end

    it 'returns an array of line items for detail' do
      expect(ship_advice.detail.line_items.length).to eq 3

      expect(ship_advice.detail.line_items[0].base_price).to eq '0.0'
      expect(ship_advice.detail.line_items[0].bill_of_lading).to eq '446614929282'
      expect(ship_advice.detail.line_items[0].container_id).to eq 'C32955120'
      expect(ship_advice.detail.line_items[0].serial_numbers.esn).to eq 'A068P900004'
      expect(ship_advice.detail.line_items[0].serial_numbers.imei).to eq '0958030364500'
      expect(ship_advice.detail.line_items[0].item_code).to eq '1PHONE'
      expect(ship_advice.detail.line_items[0].line_no).to eq '1'
      expect(ship_advice.detail.line_items[0].line_status).to eq ''
      expect(ship_advice.detail.line_items[0].pallet_id).to eq 'C32955120'
      expect(ship_advice.detail.line_items[0].scac).to eq 'FEDX'
      expect(ship_advice.detail.line_items[0].ship_quantity).to eq '1.0'
      expect(ship_advice.detail.line_items[0].unit_of_measure).to eq 'EA'
      expect(ship_advice.detail.line_items[0].universal_product_code).to eq 'A21793005511'

      expect(ship_advice.detail.line_items[1].line_no).to eq '2'
      expect(ship_advice.detail.line_items[2].line_no).to eq '3'
    end
  end
end



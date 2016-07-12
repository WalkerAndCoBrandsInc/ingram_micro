require 'spec_helper'

describe IngramMicro::SalesOrderSuccess do

  let(:input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_success.xml') }
  let(:parser) { Nori.new }
  let(:hash_from_xml) { parser.parse(input_xml) }
  let(:sales_order_success) { IngramMicro::SalesOrderSuccess.new(hash_from_xml) }

  context 'processes normal sales order success from Ingram Micro' do

    it 'creates a SalesOrderSuccess object' do
      expect(sales_order_success).to_not be_nil
    end

    it 'gets the customer-id' do
      expect(sales_order_success.customer_id).to eq '560175'
    end

    it 'processes the shipment information from the received xml' do
      expect(sales_order_success.shipment_information.ship_first_name).to eq 'Rachel Uchurch'
      expect(sales_order_success.shipment_information.ship_address1).to eq '7539 VILLAGE LN'
      expect(sales_order_success.shipment_information.ship_city).to eq 'SAINT THOMAS'
      expect(sales_order_success.shipment_information.ship_state).to eq 'PA'
      expect(sales_order_success.shipment_information.ship_post_code).to eq '17252-9701'
      expect(sales_order_success.shipment_information.ship_country_code).to eq 'US'
      expect(sales_order_success.shipment_information.ship_email).to eq 'rnuchurch@gmail.com'
      expect(sales_order_success.shipment_information.ship_via).to eq 'GGRNDP'
    end

    it 'generates purchase_order_infromation comparable to received xml' do
      expect(sales_order_success.purchase_order_information.purchase_order_number).to eq '137789'
      expect(sales_order_success.purchase_order_information.account_description).to be_nil
      expect(sales_order_success.purchase_order_information.purchase_order_amount).to be_nil
      expect(sales_order_success.purchase_order_information.currency_code).to be_nil
      expect(sales_order_success.purchase_order_information.comments).to eq [nil, '20140923']
    end

    it 'generates order_header information comparable to received xml' do
      expect(sales_order_success.order_header.customer_order_number).to eq '137789'
      expect(sales_order_success.order_header.customer_order_date).to eq '20140922'
      expect(sales_order_success.order_header.order_reference).to be_nil
      expect(sales_order_success.order_header.order_sub_total).to eq '0'
      expect(sales_order_success.order_header.order_discount).to eq '0'
      expect(sales_order_success.order_header.order_tax1).to eq '0'
      expect(sales_order_success.order_header.order_tax2).to eq '0'
      expect(sales_order_success.order_header.order_tax3).to eq '0'
      expect(sales_order_success.order_header.order_shipment_charge).to eq '0'
      expect(sales_order_success.order_header.order_total_net).to eq '0'
      expect(sales_order_success.order_header.order_type).to be_nil
      expect(sales_order_success.order_header.brightpoint_order_number).to eq '106334842'
      expect(sales_order_success.order_header.gift_flag).to be_nil
    end

    it 'returns an array of line items for detail' do
      expect(sales_order_success.detail.line_items.length).to eq 1

      expect(sales_order_success.detail.line_items[0].base_price).to be_nil
      expect(sales_order_success.detail.line_items[0].bill_of_lading).to be_nil
      expect(sales_order_success.detail.line_items[0].container_id).to be_nil
      expect(sales_order_success.detail.line_items[0].line_no).to eq '1'
      expect(sales_order_success.detail.line_items[0].item_code).to eq '0BKS'
      expect(sales_order_success.detail.line_items[0].customer_order_date).to eq '20140922'
      expect(sales_order_success.detail.line_items[0].line_status).to eq 'ACCEPTED'
      expect(sales_order_success.detail.line_items[0].line_discount).to eq '0'
      expect(sales_order_success.detail.line_items[0].line_tax1).to eq '0'
      expect(sales_order_success.detail.line_items[0].line_tax2).to eq '0'
      expect(sales_order_success.detail.line_items[0].line_tax3).to eq '0'
      expect(sales_order_success.detail.line_items[0].pallet_id).to be_nil
      expect(sales_order_success.detail.line_items[0].scac).to be_nil
      expect(sales_order_success.detail.line_items[0].quantity).to eq '1'
      expect(sales_order_success.detail.line_items[0].unit_of_measure).to be_nil
      expect(sales_order_success.detail.line_items[0].universal_product_code).to be_nil
    end

  end
end

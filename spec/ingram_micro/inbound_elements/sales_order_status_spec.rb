require 'spec_helper'

# SalesOrderStatus can be for sales-order-success or sales-order-rejection
# messages from Ingram Micro. These tests cover both scenarios.
describe IngramMicro::SalesOrderStatus do
  # Nori is the parser used to derive hash from xml
  let(:parser) { Nori.new }

  context 'processes sales order rejection from Ingram Micro' do
    let(:rejection_input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_rejection.xml') }
    let(:rejection_hash_from_xml) { parser.parse(rejection_input_xml) }
    let(:sales_order_rejection) { IngramMicro::SalesOrderStatus.new(rejection_hash_from_xml) }

    it 'creates a SalesOrderStatus object' do
      expect(sales_order_rejection).to_not be_nil
    end

    it 'gets the customer id' do
      expect(sales_order_rejection.customer_id).to eq '286104'
    end

    it 'processes the shipment information from the xml' do
      expect(sales_order_rejection.shipment_information.ship_first_name).to eq 'chris'
      expect(sales_order_rejection.shipment_information.ship_last_name).to eq 'chris'
      expect(sales_order_rejection.shipment_information.ship_middle_initial).to be_nil
      expect(sales_order_rejection.shipment_information.ship_address1).to eq '3671 Norfolk Drive'
      expect(sales_order_rejection.shipment_information.ship_address2).to be_nil
      expect(sales_order_rejection.shipment_information.ship_address3).to be_nil
      expect(sales_order_rejection.shipment_information.ship_city).to eq 'Somewhere'
      expect(sales_order_rejection.shipment_information.ship_state).to eq 'IN'
      expect(sales_order_rejection.shipment_information.ship_post_code).to eq '12345'
      expect(sales_order_rejection.shipment_information.ship_country_code).to eq 'US'
      expect(sales_order_rejection.shipment_information.ship_phone1).to eq '(317)555-5306'
      expect(sales_order_rejection.shipment_information.ship_phone2).to be_nil
      expect(sales_order_rejection.shipment_information.ship_fax).to be_nil
      expect(sales_order_rejection.shipment_information.ship_email).to eq 'montnapa@yahoo.com'
      expect(sales_order_rejection.shipment_information.ship_via).to eq 'SFXSVP'
      expect(sales_order_rejection.shipment_information.ship_request_date).to eq '20100616'
      expect(sales_order_rejection.shipment_information.ship_request_from).to be_nil
      expect(sales_order_rejection.shipment_information.ship_request_warehouse).to eq 'whse1'
    end

    it 'extracts purchase order information from the xml' do
      expect(sales_order_rejection.purchase_order_information.purchase_order_number).to eq '206285'
      expect(sales_order_rejection.purchase_order_information.comments).to eq 'Duplicate order'
      expect(sales_order_rejection.purchase_order_information.account_description).to be_nil
    end

    it 'extracts order header from the xml' do
      expect(sales_order_rejection.order_header.customer_order_number).to eq '206285'
      expect(sales_order_rejection.order_header.customer_order_date).to eq '20100616'
      expect(sales_order_rejection.order_header.order_sub_total).to eq '0.0'
      expect(sales_order_rejection.order_header.order_discount).to eq '0.0'
      expect(sales_order_rejection.order_header.order_tax1).to eq '0.0'
      expect(sales_order_rejection.order_header.order_tax2).to eq '0.0'
      expect(sales_order_rejection.order_header.order_tax3).to eq '0.0'
      expect(sales_order_rejection.order_header.order_shipment_charge).to eq '0.0'
      expect(sales_order_rejection.order_header.order_total_net).to eq '0.0'
    end

    it 'extracts details from the xml' do
      expect(sales_order_rejection.detail.line_items.length).to eq 1

      expect(sales_order_rejection.detail.line_items[0].base_price).to be_nil
      expect(sales_order_rejection.detail.line_items[0].bill_of_lading).to be_nil
      expect(sales_order_rejection.detail.line_items[0].container_id).to be_nil
      expect(sales_order_rejection.detail.line_items[0].line_no).to eq '0'
      expect(sales_order_rejection.detail.line_items[0].item_code).to eq 'TKAKN10001'
      expect(sales_order_rejection.detail.line_items[0].rejection_date).to eq '20100617'
      expect(sales_order_rejection.detail.line_items[0].line_status).to eq 'REJECTED'
      expect(sales_order_rejection.detail.line_items[0].line_discount).to eq '0.0'
      expect(sales_order_rejection.detail.line_items[0].line_tax1).to eq '0.0'
      expect(sales_order_rejection.detail.line_items[0].line_tax2).to eq '0.0'
      expect(sales_order_rejection.detail.line_items[0].line_tax3).to eq '0.0'
      expect(sales_order_rejection.detail.line_items[0].pallet_id).to be_nil
      expect(sales_order_rejection.detail.line_items[0].comments).to eq 'Domino'
      expect(sales_order_rejection.detail.line_items[0].quantity).to eq '1'
      expect(sales_order_rejection.detail.line_items[0].unit_of_measure).to eq 'EA'
      expect(sales_order_rejection.detail.line_items[0].universal_product_code).to be_nil
    end
  end

  context 'processes sales order success from Ingram Micro' do
    let(:success_input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_success.xml') }
    let(:success_hash_from_xml) { parser.parse(success_input_xml) }
    let(:sales_order_success) { IngramMicro::SalesOrderStatus.new(success_hash_from_xml) }

    it 'creates a SalesOrderStatus object' do
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
      expect(sales_order_success.order_header.customer_order_number).to eq '562134'
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

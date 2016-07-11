require 'spec_helper'
require 'active_support/core_ext/hash'

describe IngramMicro::SalesOrderRejection do

  let(:input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_rejection.xml') }
  let(:hash_from_xml) { Hash.from_xml(input_xml) }
  let(:sales_order_rejection) { IngramMicro::SalesOrderRejection.new(hash_from_xml) }

  context 'processes sales order rejection from Ingram Micro' do

    it 'creates a SalesOrderRejection object' do
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
end

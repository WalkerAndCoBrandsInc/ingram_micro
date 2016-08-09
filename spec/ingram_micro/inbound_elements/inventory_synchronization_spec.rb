require 'spec_helper'

describe IngramMicro::InventorySync do

  let(:input_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/inventory_synchronization.xml') }
  let(:parser) { Nori.new }
  let(:hash_from_xml) { parser.parse(input_xml) }
  let(:inventory_sync) { IngramMicro::InventorySync.new(hash_from_xml) }
  let(:detail) { inventory_sync.detail }
  context 'processes inventory synchronization from Ingram Micro' do

    it 'creates an InventorySync object' do
      expect(inventory_sync).to_not be_nil
      expect(inventory_sync.transaction_name).to eq 'inventory-synchronization'
    end

    it 'extracts details from the transmission' do
      expect(detail).to be_truthy
      expect(detail.class).to eq IngramMicro::InventorySyncDetail
    end

    it 'creates line items from the detail' do
      line_items = detail.line_items
      expect(line_items).to be_truthy
      expect(line_items.is_a?(Array)).to be true
      expect(line_items.count).to eq 5
    end

    it 'creates line items with correct information' do
      line_items = detail.line_items
      first_line_item = line_items.first

      expect(first_line_item.line_no).to eq 1
      expect(first_line_item.transaction_document_number).to eq 'N85'
      expect(first_line_item.item_code).to eq 'N85'
      expect(first_line_item.universal_product_code).to eq 0
      expect(first_line_item.warehouse_id).to eq 'whse1'
      expect(first_line_item.unit_of_measure).to eq 'EA'
      expect(first_line_item.quantity_on_hand).to eq 100
      expect(first_line_item.quantity_committed).to eq 0
      expect(first_line_item.quantity_available).to eq 100
      expect(first_line_item.quantity_on_back_order).to eq 0
      expect(first_line_item.synchronization_timestamp).to eq 20090824152437
    end

  end
end

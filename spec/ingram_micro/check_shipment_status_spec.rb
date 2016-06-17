require 'spec_helper'

describe IngramMicro::CheckShipmentStatus do

  let(:empty_shipment_status) { IngramMicro::CheckShipmentStatus.new }

  describe 'valid' do
    it 'creates a valid xml form' do
      expect(empty_shipment_status.valid?).to be true
    end
  end

  describe 'order_builder' do
    it 'generates xml' do
      expected_xml = File.read(IngramMicro::GEM_DIR + 'spec/output_xmls/empty_shipment_status.xml')
      puts empty_shipment_status.order_builder.to_xml
      expect(empty_shipment_status.order_builder.to_xml).to eq expected_xml

      hash_from_xml = Hash.from_xml(empty_shipment_status.order_builder.to_xml)
      expect(hash_from_xml['message']['message_header']['transaction_name']).to eq 'shipment-status'
    end
  end
end

require 'spec_helper'

describe IngramMicro::CheckShipmentStatus do

  let(:empty_shipment_status) { IngramMicro::CheckShipmentStatus.new }
  let(:options) {{
    business_name: 'Nguyen & Sedano Inc.',
    customer_id: '1',
    line_items: [FactoryGirl.build(:shipment_status_line_item)]
  }}

  let(:shipment_status_with_info) { IngramMicro::CheckShipmentStatus.new(options) }


  describe 'valid' do
    context 'shipment status is empty' do
      it 'creates a valid xml form' do
        expect(empty_shipment_status.schema_valid?).to be true
      end
    end

    context 'shipment status with information' do
      it 'creates a valid xml form' do
        expect(shipment_status_with_info.schema_valid?).to be true
      end
    end
  end

  describe 'order_builder' do
    context 'shipment status is empty' do
      it 'generates xml' do
      expected_xml = File.read(IngramMicro::GEM_DIR + 'spec/output_xmls/empty_shipment_status.xml')
      expect(empty_shipment_status.order_builder.to_xml).to eq expected_xml

      hash_from_xml = Hash.from_xml(empty_shipment_status.order_builder.to_xml)
      expect(hash_from_xml['message']['message_header']['transaction_name']).to eq 'shipment-status'
      end
    end

    context 'shipment status with information' do
      it 'generates xml' do
        expected_xml = File.read(IngramMicro::GEM_DIR + 'spec/output_xmls/populated_shipment_status.xml')
        expect(shipment_status_with_info.order_builder.to_xml).to eq expected_xml

        hash_from_xml = Hash.from_xml(shipment_status_with_info.order_builder.to_xml)
        expect(hash_from_xml['message']['message_header']['transaction_name']).to eq 'shipment-status'
      end
    end
  end
end

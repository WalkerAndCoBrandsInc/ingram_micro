require 'spec_helper'

describe IngramMicro::OutboundShipmentInformation do

  let(:empty_shipment_info) { IngramMicro::OutboundShipmentInformation.new }
  let(:shipment_info) { Fabricate.build(:shipment_information)}
  let(:ship_info_bad_shipping_method) { IngramMicro::OutboundShipmentInformation.new({ship_via: 'ABCD'})}

  describe '#initialize' do
    context 'without values passed in' do
      it 'creates a ShipmentInformation object with a hash' do
        expect(empty_shipment_info.element).to be_a(Hash)
      end

      it 'has attributes set to default values' do
        expect(empty_shipment_info.element[:ship_first_name]).to be nil
        expect(empty_shipment_info.element[:ship_city]).to be nil
        expect(empty_shipment_info.element[:ship_via]).to be nil
      end
    end

    context 'with data provided at initialization' do
      it 'creates a ShipmentInformation object' do
        expect(shipment_info).to be_truthy
      end

      it 'has attributes set to specified values' do
        expect(shipment_info.element[:ship_first_name]).to be_a(String)
        expect(shipment_info.element[:ship_city]).to be_a(String)
        expect(shipment_info.element[:ship_via]).to be_a(String)
      end
    end
  end

  describe '#valid_shipping_methods?' do
    context 'without values passed in' do
      it 'returns false for a nil SHIPPING_METHODS' do
        expect(empty_shipment_info.valid_shipping_methods?).to be false
      end
    end
    context 'with a valid shipping code entered' do
      it 'returns true' do
        expect(shipment_info.valid_shipping_methods?).to be true
      end
    end
    context 'with an invalid shipping code entered' do
      it 'returns false' do
        expect(ship_info_bad_shipping_method.valid_shipping_methods?).to be false
      end
    end
  end

  describe '#add_ship_address2' do
    it 'adds a default shipping_address2' do
      shipment_info.add_ship_address2
      expect(shipment_info.element[:ship_address2]).to eq ' '
    end
  end

  describe '#shipping_method_name' do
    context 'with no shipping_method value passed in' do
      it 'returns invalid shipping_method message' do
        expect(empty_shipment_info.shipping_method_name).to eq('Invalid shipping code')
      end
    end
    context 'with invalid shipping_method value passed in' do
      it 'returns invalid shipping_method message' do
        expect(ship_info_bad_shipping_method.shipping_method_name).to eq('Invalid shipping code')
      end
    end

    context 'with valid shipping_method value passed in' do
      it 'should return the shipping method associated with the code' do
        expect(IngramMicro::OutboundShipmentInformation::SHIPPING_METHODS.values).to include(shipment_info.shipping_method_name)
      end
    end
  end

  it 'formats xml' do
    Nokogiri::XML::Builder.new do |builder|
      builder.send('message') do
        IngramMicro::OutboundShipmentInformation.new({ship_first_name: 'Jeffrey'}).build(builder)
      end

      expect(builder.to_xml).to include('<ship-first-name>Jeffrey</ship-first-name>')
    end
  end
end

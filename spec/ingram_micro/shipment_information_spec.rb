require 'spec_helper'

describe IngramMicro::ShipmentInformation do

  let(:empty_shipment_info) { IngramMicro::ShipmentInformation.new }

  let(:shipment_options) {{
    ship_first_name: "Jeffrey",
    ship_last_name: "Lebowski",
    ship_middle_initial: "D",
    ship_address1: "606 Venezia Ave Apt B",
    ship_address2: nil,
    ship_address3: nil,
    ship_city: "Venice",
    ship_state: "CA",
    ship_post_code: "90291",
    ship_country_code: "US",
    ship_phone1: "213-371-9147",
    ship_phone2: nil,
    ship_fax: nil,
    ship_email: "the_dude@yahoo.com",
    ship_via: "FX2D",
    ship_request_date: nil,
    ship_request_from: nil,
    ship_request_warehouse: nil
  }}

  let(:shipment_info_with_data) { IngramMicro::ShipmentInformation.new(shipment_options)}

  let(:ship_info_bad_scac) { IngramMicro::ShipmentInformation.new({ship_via: "ABCD"})}

  describe '#initialize' do
    context 'without values passed in' do
      it 'creates a ShipmentInformation object' do
        expect(empty_shipment_info).to be_truthy
      end

      it 'has attributes set to default values' do
        expect(empty_shipment_info.ship_first_name).to be nil
        expect(empty_shipment_info.ship_city).to be nil
        expect(empty_shipment_info.ship_via).to be nil
      end
    end

    context 'with data provided at initialization' do
      it 'creates a ShipmentInformation object' do
        expect(shipment_info_with_data).to be_truthy
      end

      it 'has attributes set to specified values' do
        expect(shipment_info_with_data.ship_first_name).to eq('Jeffrey')
        expect(shipment_info_with_data.ship_city).to eq('Venice')
        expect(shipment_info_with_data.ship_via).to eq('FX2D')
      end
    end
  end

  describe '#valid_scac?' do
    context 'without values passed in' do
      it 'returns false for a nil SCAC' do
        expect(empty_shipment_info.valid_scac?).to be false
      end
    end
    context 'with a valid shipping code entered' do
      it 'returns true' do
        expect(shipment_info_with_data.valid_scac?).to be true
      end
    end
    context 'with an invalid shipping code entered' do
      it 'returns false' do
        expect(ship_info_bad_scac.valid_scac?).to be false
      end
    end
  end

  describe '#shipping_method_name' do
    context 'with no scac value passed in' do
      it 'returns invalid scac message' do
        expect(empty_shipment_info.shipping_method_name).to eq('Invalid shipping code')
      end
    end
    context 'with invalid scac value passed in' do
      it 'returns invalid scac message' do
        expect(ship_info_bad_scac.shipping_method_name).to eq('Invalid shipping code')
      end
    end

    context 'with valid scac value passed in' do
      it 'should return the shipping method associated with the code' do
        expect(shipment_info_with_data.shipping_method_name).to eq('FedEx Second Day')
      end
    end
  end
end

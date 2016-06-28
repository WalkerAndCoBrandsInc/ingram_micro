require 'spec_helper'

describe IngramMicro::ShipmentInformation do

  let(:empty_shipment_info) { IngramMicro::ShipmentInformation.new }

  let(:shipment_options) {{
    ship_first_name: 'Jeffrey',
    ship_last_name: 'Lebowski',
    ship_middle_initial: 'D',
    ship_address1: '606 Venezia Ave Apt B',
    ship_address2: nil,
    ship_address3: nil,
    ship_city: 'Venice',
    ship_state: 'CA',
    ship_post_code: '90291',
    ship_country_code: 'US',
    ship_phone1: '213-371-9147',
    ship_phone2: nil,
    ship_fax: nil,
    ship_email: 'the_dude@yahoo.com',
    ship_via: 'FX2D',
    ship_request_date: nil,
    ship_request_from: nil,
    ship_request_warehouse: nil
  }}

  let(:shipment_info_with_data) { IngramMicro::ShipmentInformation.new(shipment_options)}

  let(:ship_info_bad_shipping_method) { IngramMicro::ShipmentInformation.new({ship_via: 'ABCD'})}

  describe '#initialize' do
    context 'without values passed in' do
      it 'creates a ShipmentInformation object' do
        expect(empty_shipment_info).to be_truthy
      end

      it 'has attributes set to default values' do
        expect(empty_shipment_info.element[:ship_first_name]).to be nil
        expect(empty_shipment_info.element[:ship_city]).to be nil
        expect(empty_shipment_info.element[:ship_via]).to be nil
      end
    end

    context 'with data provided at initialization' do
      it 'creates a ShipmentInformation object' do
        expect(shipment_info_with_data).to be_truthy
      end

      it 'has attributes set to specified values' do
        expect(shipment_info_with_data.element[:ship_first_name]).to eq('Jeffrey')
        expect(shipment_info_with_data.element[:ship_city]).to eq('Venice')
        expect(shipment_info_with_data.element[:ship_via]).to eq('FX2D')
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
        expect(shipment_info_with_data.valid_shipping_methods?).to be true
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
      shipment_info_with_data.add_ship_address2
      expect(shipment_info_with_data.element[:ship_address2]).to eq ' '
    end

    it 'adds a default shipping_address2' do
      shipment_options[:ship_address2] = 'c/o the devil'
      shipment_info_with_data = IngramMicro::ShipmentInformation.new(shipment_options)

      shipment_info_with_data.add_ship_address2

      expect(shipment_info_with_data.element[:ship_address2]).to eq 'c/o the devil'
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
        expect(shipment_info_with_data.shipping_method_name).to eq('FedEx Second Day')
      end
    end
  end

  it 'formats xml' do
    Nokogiri::XML::Builder.new do |builder|
      builder.send('message') do
        IngramMicro::ShipmentInformation.new(shipment_options).build(builder)
      end

      expect(builder.to_xml).to include('<ship-first-name>Jeffrey</ship-first-name>')
    end
  end
end

require 'spec_helper'

describe IngramMicro::CheckShipmentStatus do

  let(:shipment_status) { IngramMicro::CheckShipmentStatus.new }

  describe "creates and sends a shipment status request" do
    context "xml form" do
      it "is valid" do
        expect(shipment_status.valid?).to be true
      end
    end

    context "form transmission" do
      it "sends the form" do
        expect(shipment_status.submit_request).to be_truthy
      end
    end
  end

end

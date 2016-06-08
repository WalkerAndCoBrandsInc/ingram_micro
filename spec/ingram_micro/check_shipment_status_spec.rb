require 'spec_helper'

describe IngramMicro::CheckShipmentStatus do

  let(:empty_shipment_status) { IngramMicro::CheckShipmentStatus.new }

  let(:ss_options) {{
    customer_id: nil,
    business_name: nil,
    detail: nil,
    line_items: []
    }}

  describe "xml form creation" do
    context "with no data passed" do
      it "creates a valid xml form" do
        expect(empty_shipment_status.valid?).to be true
      end
    end
  end

  describe "creates and sends a shipment status request" do
    context "xml form" do
      it "is valid" do
        expect(empty_shipment_status.valid?).to be true
      end
    end

    context "form transmission" do
      it "sends the form" do
        expect(empty_shipment_status.submit_request).to be_truthy
      end
    end
  end

end

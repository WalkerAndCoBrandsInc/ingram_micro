require 'spec_helper'

describe IngramMicro::Client do

  let(:client) { IngramMicro::Client.new }

  describe "#initialize" do
    context "creates Faraday connection" do
      it "initializes a Faraday connection" do
        expect(client).to be_truthy
      end
    end
  end

  let(:sales_order) { IngramMicro::SalesOrder.new }

  describe "Client#post" do
    context "the client hits the right host" do

      it "sends data to requestbin" do
        expect(client.post(sales_order.order_builder.to_xml)).to be_truthy
      end

    end
  end

  describe "call from SalesOrder class" do
    context "the client can be used by other classes" do
      # 
      # it "creates a valid sales order xml form" do
      #   expect(sales_order.valid?).to be true
      # end

      it "sends requests on behalf of a SalesOrder object" do
        expect(sales_order.order_request).to be_truthy
      end
    end
  end

end

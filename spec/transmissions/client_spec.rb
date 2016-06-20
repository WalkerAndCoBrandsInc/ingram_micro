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

  describe "Client#get" do
    context "Basic request to default url" do
      skip "should make a get request" do
        expect(client.get).to be_truthy
      end
    end
  end

  describe "Client#post" do
    context "the client hits the right host" do

      skip "sends data to requestbin" do
        expect(client.post("TEST")).to be_truthy
      end

    end
  end
end

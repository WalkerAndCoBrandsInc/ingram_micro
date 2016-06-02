require 'spec_helper'

describe IngramMicro::ReturnAuthorization do

  let(:return_authorization) { IngramMicro::ReturnAuthorization.new }

  describe "creates and sends a return authorization request" do
    context "xml form" do
      it "is valid" do
        expect(return_authorization.valid?).to be true
      end
    end

    context "form transmission" do
      it "sends the form" do
        expect(return_authorization.order_request).to be_truthy
      end
    end
  end

end

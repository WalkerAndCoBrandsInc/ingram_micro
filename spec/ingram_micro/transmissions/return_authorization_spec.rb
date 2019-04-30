require "spec_helper"

describe IngramMicro::ReturnAuthorization do
  describe '#build' do
    let(:return_auth) { Fabricate.build(:return_authorization) }

    it "uses passed in return_authorization id" do
      expect(return_auth.xml_builder.to_xml).to include('<customer-order-number>RA111</customer-order-number>')
    end

    describe "customer id attribute" do
      context "with customer id param passed in" do
        it "sets customer_id" do
          return_auth = IngramMicro::ReturnAuthorization.new({customer_id: 12341234}).
            xml_builder.to_xml
          expect(return_auth).to include("<customer-id>12341234</customer-id>")
        end
      end

      context "with customer id param not passed in" do
        it "pulls from the configuration" do
          return_auth = IngramMicro::ReturnAuthorization.new.xml_builder.to_xml
          expect(return_auth).to include("<customer-id>123</customer-id>")
        end
      end
    end
  end
end

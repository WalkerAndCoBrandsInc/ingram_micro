require "spec_helper"

describe IngramMicro::ReturnAuthorization do
  let(:return_auth_with_info) { Fabricate.build(:return_authorization) }

  describe "#build" do
    context "with data entered" do
      it "is valid" do
        expect(return_auth_with_info.schema_valid?).to be true
      end

      it "uses passed in return_authorization id" do
        expect(return_auth_with_info.xml_builder.to_xml).to include('<customer-order-number>RA111</customer-order-number>')
      end
    end
  end
end

require 'spec_helper'

describe IngramMicro::ReturnReceipt do
  let(:return_receipt) do
    hash = Nori.new.parse(File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/return-receipt.xml'))
    IngramMicro::ReturnReceipt.new(hash)
  end

  it "returns customer_id" do
    expect(return_receipt.customer_id).to eq("565663")
  end
end

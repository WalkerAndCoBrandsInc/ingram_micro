require 'spec_helper'

describe IngramMicro::ReturnReceipt do
  let(:return_receipt) do
    hash = Nori.new.parse(File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/return_receipt.xml'))
    IngramMicro::ReturnReceipt.new(hash)
  end

  skip do
  end
end

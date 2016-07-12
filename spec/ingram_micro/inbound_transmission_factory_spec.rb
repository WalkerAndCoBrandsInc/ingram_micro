require 'spec_helper'

describe IngramMicro::InboundTransmissionFactory do
  let(:sales_order_success_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_success.xml') }
  let(:sales_order_rejection_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_rejection.xml') }
  let(:ship_advice_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/ship_advice.xml') }

  context 'Processes incoming sales order success data' do
    it 'creates an inbound transmission object from request body string' do
      result = IngramMicro::InboundTransmissionFactory.from_xml(sales_order_success_xml)
      expect(result.customer_id).to eq '560175'
    end
  end

  context 'Processes incoming sales order rejection data' do
    it 'creates an inbound transmission object from request body string' do
      result = IngramMicro::InboundTransmissionFactory.from_xml(sales_order_rejection_xml)
      expect(result.customer_id).to eq '286104'
    end
  end

  context 'Processes incoming ship advice data' do
    it 'creates an inbound transmission object from request body string' do
      result = IngramMicro::InboundTransmissionFactory.from_xml(ship_advice_xml)
      expect(result.customer_id).to eq '308524'
    end
  end

  context 'when the input string is not well-formed xml' do
    it 'raises an error' do
      expect {
        IngramMicro::InboundTransmissionFactory.from_xml('>>>bork')
      }.to raise_error 'IngramMicro::InboundTransmissionFactory received malformed XML: >>>bork'
    end
  end

  context 'when the transaction_name is not recognized' do
    it 'raises an error' do
      expect {
        IngramMicro::InboundTransmissionFactory.from_xml(%Q{
          <message>
            <message-header>
              <transaction-name>foo</transaction-name>
            </message-header>
          </message>
        })
      }.to raise_error 'IngramMicro::InboundTransmissionFactory received unrecognized transaction-name: foo'
    end
  end
end

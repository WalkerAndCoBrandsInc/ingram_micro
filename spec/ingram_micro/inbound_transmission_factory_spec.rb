require 'spec_helper'
require 'pry'

describe IngramMicro::InboundTransmissionFactory do
  let(:sales_order_success_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_success.xml') }
  let(:sales_order_rejection_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_rejection.xml') }
  let(:ship_advice_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/ship_advice.xml') }
  let(:sales_order_submission_xml) { File.read(IngramMicro::GEM_DIR + 'spec/input_xmls/sales_order_submission.xml') }

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

  context 'Processes incoming sales order subsmission data' do
    it 'creates an inbound transmission object from request body string' do
      result = IngramMicro::InboundTransmissionFactory.from_xml(sales_order_submission_xml)
      expect(result.customer_id).to eq '566978'
    end
  end

  context 'when the input string is not well-formed xml' do
    it 'raises an error' do
      expect do
        IngramMicro::InboundTransmissionFactory.from_xml('>>>bork')
      end.to raise_error(
               IngramMicro::InboundTransmissionFactory::Error,
               /IngramMicro::InboundTransmissionFactory received malformed XML: >>>bork/
             )
    end
  end

  context 'when the transaction_name is not recognized' do
    it 'raises an error' do
      expect do
        IngramMicro::InboundTransmissionFactory.from_xml(%Q{
          <message>
            <message-header>
              <transaction-name>foo</transaction-name>
            </message-header>
          </message>
        })
      end.to raise_error(
               IngramMicro::InboundTransmissionFactory::Error,
               /IngramMicro::InboundTransmissionFactory received unrecognized transaction-name: foo/
             )
    end
  end
end

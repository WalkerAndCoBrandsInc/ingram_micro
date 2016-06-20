require 'spec_helper'

[IngramMicro::SalesOrderSubmission, IngramMicro::ShipmentStatus, IngramMicro::ReturnAuthorizationSubmission].each do |klass|
  describe klass do
    let(:required_options) {{}}

    context 'a numerical input for' do
      it 'customer id is cool' do
        options = required_options.merge({customer_id: 565661})
        header = klass.new(options)
        expect(header.valid?).to be true
      end
    end

    context 'a string input for' do
      it 'customer id raises an error' do
        options = required_options.merge({customer_id: 'customer2'})
        header = klass.new(options)
        expect { header.valid? }.to raise_error(IngramMicro::InvalidType)
      end
    end
  end
end

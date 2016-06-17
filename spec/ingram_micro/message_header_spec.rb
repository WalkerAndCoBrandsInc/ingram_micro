require 'spec_helper'

[IngramMicro::MessageHeaderPW, IngramMicro::MessageHeaderNoPW].each do |klass|

  describe klass do
    context 'a numerical message id' do
      it 'is cool' do
        options = {message_id: 25, partner_name: 'partner_name'}
        message_header = klass.new(options)
        expect(message_header.valid?).to be true
      end
    end

    context 'an string message id' do
      it 'raises an error' do
        options = {message_id: 'heyfriend', partner_name: 'partner_name'}
        message_header = klass.new(options)
        expect { message_header.valid? }.to raise_error(IngramMicro::InvalidType)
      end
    end

    context 'missing partner_name field' do
      it 'raises an error' do
        options = {message_id: '1234'}
        message_header = klass.new(options)
        expect { message_header.valid? }.to raise_error(IngramMicro::MissingField)
      end
    end

  end
end

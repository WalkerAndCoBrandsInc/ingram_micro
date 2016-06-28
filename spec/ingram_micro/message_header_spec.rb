require 'spec_helper'

[IngramMicro::MessageHeaderPW, IngramMicro::MessageHeaderNoPW].each do |klass|

  describe klass do
    let(:required_options) {{partner_name: 'partner_name'}}

    context 'a numerical input for' do
      it 'message id is cool' do
        options = required_options.merge({message_id: 25})
        message_header = klass.new(options)
        expect(message_header.valid?).to be true
      end
    end

    context 'a string input for' do
      it 'message id raises an error' do
        options = required_options.merge({message_id: 'heyfriend'})
        message_header = klass.new(options)
        expect { message_header.valid? }.to raise_error(IngramMicro::InvalidType)
      end
    end

    context 'missing field should raise an error' do
      it 'for partner_name ' do
        options = {message_id: '1234'}
        message_header = klass.new(options)
        expect { message_header.valid? }.to raise_error(IngramMicro::MissingField)
      end
    end

    it 'formats create-timestamp in the correct format' do
      options = required_options.merge({create_timestamp: Time.new(2016, 6, 22, 4, 30, 17)})
      Nokogiri::XML::Builder.new do |builder|
        builder.send('message') do
          klass.new(options).build(builder)
        end

        expect(builder.to_xml).to include('<create-timestamp>20160622043017</create-timestamp>')
      end
    end
  end
end

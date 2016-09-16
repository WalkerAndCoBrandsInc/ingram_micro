require 'spec_helper'

describe IngramMicro::SalesOrderLineItem do
  let(:line_item) { Fabricate.build(:sales_order_line_item) }

  describe '#line_no and #line_no=' do
    it 'Gets the line_no' do
      expect(line_item.line_no).to eq 1
    end

    it "Sets the line_no" do
      line_item.element[:line_no] = 4

      expect(line_item.line_no).to eq 4
    end
  end

  describe '#add_line_name_value' do
    let(:line_attr_name) { 'international-declared-value' }
    let(:line_attr_value) { '1999' }

    context 'called as part of #build' do
      let(:blankli) { described_class.new }
      context 'when no name-value pairs are present' do
        it 'does not get called if no name-value pairs are present' do
          builder = Nokogiri::XML::Builder.new
          expect(blankli).to_not receive(:add_line_name_value)

          builder.send('message') do
            (blankli.build(builder))
          end
        end
      end

      # For some reason, using let(:builder) and let(:li) for this context does
      # not work the same way as defining them in each it block.
      # Furthermore, the expectation that li would receive :add_line_name_value
      # appears to prevent the method from actually being called, which means
      # the resulting xml won't appear unless it is called in a separate test.
      context 'when shipping using the international schema' do
        before do
          IngramMicro.configuration.international_schema = true
        end

        context 'when at least one attribute-value pair is present' do
          it 'gets called' do
            li = described_class.new(line_name_value: {international_license_value: '300.50'})
            builder = Nokogiri::XML::Builder.new

            expect(li).to receive(:add_line_name_value)
            builder.send('message') do
              li.build(builder)
            end
          end

          it 'properly creates xml' do
            li = described_class.new(product_name: "killerizer", line_name_value: {international_license_value: '300.50'})
            builder = Nokogiri::XML::Builder.new
            builder.send('message') do
              li.build(builder)
            end

            expect(builder.to_xml).to include('<line-attribute-name>international-license-value')
            expect(builder.to_xml).to include('<line-attribute-value>300.50')
          end
        end
      end
    end
  end

  describe '#add_special_message' do
    it 'does not create a new special message object if nothing is passed in' do
      builder = Nokogiri::XML::Builder.new
      li = described_class.new
      builder.send('message') do
        li.build(builder)
      end

      expect(builder.to_xml).to_not include('<special-message/>')
    end

    it 'adds a special message to the xml if one is passed in' do
      builder = Nokogiri::XML::Builder.new
      message = IngramMicro::SalesOrderLineItemSpecialMessage.new(
        engraving_font: 'hellavetica',
        engraving_location: 'Santa Cruz',
        special_message1: 'duuuude'
      )
      li = described_class.new(special_message: message)
      builder.send('message') do
        li.build(builder)
      end

      expect(builder.to_xml).to include('<special-message>')
      expect(builder.to_xml).to include('<engraving-font>hellavetica')
    end
  end
end

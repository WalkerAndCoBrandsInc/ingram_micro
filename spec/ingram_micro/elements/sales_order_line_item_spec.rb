require 'spec_helper'
require 'pry'

describe IngramMicro::SalesOrderLineItem do
  # let(:populated_sales_order) { Fabricate.build(:sales_order) }
  # let(:line_item_1) { populated_sales_order.detail.element[:line_items].first }
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
    context 'called explicitly' do
      let(:builder) { Nokogiri::XML::Builder.new }
      let!(:line_name_value_xml) { line_item.add_line_name_value(line_attr_name, line_attr_value, builder).build }
      it "passes information to the line-name-value" do
        expect(builder.to_xml).to include('<line-attribute-name>international-declared')
        expect(builder.to_xml).to include('<line-attribute-value>1999</line-attribute-value>')
      end
    end

    context 'called as part of #build' do

      let(:test_builder) { Nokogiri::XML::Builder.new }
      let(:default_line_item) { described_class.new }
      it 'does not get called if no name-value pairs are present' do
        expect(default_line_item).to_not receive(:add_line_name_value)

        default_line_item.build(test_builder)
      end
    end
  end
end

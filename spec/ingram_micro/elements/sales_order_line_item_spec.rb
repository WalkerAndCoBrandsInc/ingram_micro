require 'spec_helper'

describe IngramMicro::SalesOrderLineItem do
  let(:populated_sales_order) { Fabricate.build(:sales_order) }
  let(:line_item_1) { populated_sales_order.detail.element[:line_items].first }

  describe '#line_no and #line_no=' do
    it 'Gets the line_no' do
      expect(line_item_1.line_no).to eq 1
    end

    it "Sets the line_no" do
      line_item_1.element[:line_no] = 4

      expect(line_item_1.line_no).to eq 4
    end
  end

  describe '#line_name_value' do
    let(:builder) { Nokogiri::XML::Builder.new }
    it 'works fine with a valid attribute name' do
      name = 'warranty-item'
      value = 'true'
      expect{line_item_1.line_name_value(name, value, builder)}.to_not raise_error
    end

    it 'raises an error with an invalid attribute name passed in' do
      name, value = 'whatevs', 'WHATEVER'

      expect{line_item_1.line_name_value(name, value, builder)}.to raise_error(ArgumentError)
    end
  end

end

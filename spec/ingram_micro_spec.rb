require 'spec_helper'

describe IngramMicro do
  it 'has a version number' do
    expect(IngramMicro::VERSION).not_to be nil
  end

  context "configuration" do
    it "has a configuration" do
      expect(IngramMicro.configuration).to be_a IngramMicro::Configuration
    end

    describe ".configure" do
      it "accepts a block" do
        IngramMicro.configure do |config|
          config.api_root = "https://ingram.com/foo"
        end

        expect(IngramMicro.configuration.api_root).to eq "https://ingram.com/foo"
      end

      it 'ensures that the config is valid' do
        expect do
          IngramMicro.configure do |config|
            config.customer_id = nil
          end
        end.to raise_error IngramMicro::Configuration::Error
      end
    end
  end

  context "random order number generator" do
    it "generates a random number with no prefix" do
      random_number = IngramMicro.generate_order_number
      expect(random_number).not_to be_nil
      expect(random_number.length).to eq 5
    end

    it "generates a random number with an integer" do
      random_number = IngramMicro.generate_order_number('1234')
      expect((random_number).start_with?('1234')).to be_truthy
      expect(random_number.length).to eq 9
    end

    it "returns nil when given an invalid prefix" do
      random_number = IngramMicro.generate_order_number('12dj34')
      expect(random_number).to be_nil
    end

    it "extracts the original prefix based on random number" do
      original_id1 = 2123
      original_id2 = 3
      original_id3 = 19730

      random_number = IngramMicro.generate_order_number(original_id1)
      expect(original_id1.to_s).to eq IngramMicro.extract_order_number(random_number)

      random_number = IngramMicro.generate_order_number(original_id2)
      expect(original_id2.to_s).to eq IngramMicro.extract_order_number(random_number)

      random_number = IngramMicro.generate_order_number(original_id3)
      expect(original_id3.to_s).to eq IngramMicro.extract_order_number(random_number)
    end

  end
end

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

  describe "#self.domestic_shipping?" do
    context "when no international setting is passed in" do
      it "returns true" do
        IngramMicro.configure do |config|
          config.api_root = "https://ingram.com/foo"
        end

        expect(IngramMicro.domestic_shipping?).to be true
      end
    end
    context "when international is set to true" do
      it "returns false" do
        IngramMicro.configure do |config|
          config.api_root = "https://ingram.com/foo"
          config.international = true
        end

        expect(IngramMicro.domestic_shipping?).to be false
      end
    end
    context "when international is set to false" do
      it "returns true" do
        IngramMicro.configure do |config|
          config.api_root = "https://ingram.com/foo"
          config.international = false
        end

        expect(IngramMicro.domestic_shipping?).to be true
      end
    end
  end
end

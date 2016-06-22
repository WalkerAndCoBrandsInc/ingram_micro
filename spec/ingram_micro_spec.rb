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
end

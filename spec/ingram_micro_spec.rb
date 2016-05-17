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
          config.debug = true
        end

        expect(IngramMicro.configuration.api_root).to eq "https://ingram.com/foo"
        expect(IngramMicro.configuration.debug).to eq true
      end
    end
  end
end

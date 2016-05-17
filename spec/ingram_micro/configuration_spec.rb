require 'spec_helper'
require 'logger'

describe IngramMicro::Configuration do
  let(:config) { IngramMicro::Configuration.new }

  it "can set api root" do
    config.api_root = "https://imm.com/post"

    expect(config.api_root).to eq "https://imm.com/post"
  end

  it "can set debug" do
    config.debug = true

    expect(config.debug).to eq true
  end

  it "can set logger" do
    config.logger = Logger.new(STDOUT)

    expect(config.logger).to be_a Logger
  end
end

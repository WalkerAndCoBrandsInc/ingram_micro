require 'spec_helper'
require 'logger'

describe IngramMicro::Configuration do
  let(:config) { IngramMicro::Configuration.new }

  it 'sets api root' do
    config.api_root = 'https://imm.com/post'

    expect(config.api_root).to eq 'https://imm.com/post'
  end

  it 'sets debug' do
    config.debug = true

    expect(config.debug).to eq true
  end

  it 'sets logger' do
    config.logger = Logger.new(STDOUT)

    expect(config.logger).to be_a Logger
  end

  it 'sets crt file' do
    config.ca_file = '/etc/ssl/certs/ca-certificates.crt'

    expect(config.ca_file).to eq '/etc/ssl/certs/ca-certificates.crt'
  end

  it 'sets partner name' do
    config.partner_name = 'walker and co'

    expect(config.partner_name).to eq 'walker and co'
  end

  it "sets partner password" do
    config.partner_password = "password"

    expect(config.partner_password).to eq "password"
  end

  it "sets source url" do
    config.source_url = "https://www.getbevel.com"

    expect(config.source_url).to eq "https://www.getbevel.com"
  end

  describe "#valid?" do
    let(:config) { IngramMicro.configuration }
    let(:api_root) { "https://imm.com" }
    let(:ca_file) { "/foo/ca-certificates.crt" }
    let(:partner_name) { 'walker and co' }
    let(:partner_password) { 'password' }
    let(:source_url) { "https://www.getbevel.com" }
    let(:debug) { false }
    let(:logger) { nil }

    before do
      IngramMicro.configure do |config|
        config.api_root = api_root
        config.ca_file = ca_file
        config.debug = debug
        config.logger = logger
        config.partner_password = partner_password
        config.partner_name = partner_name
        config.source_url = source_url
      end
    end

    context "ca_file and api_root are set" do
      it "is true" do
        expect(config).to be_valid
      end
    end

    context "ca_file is empty" do
      let(:ca_file) { nil }

      it "is false" do
        expect(config).to_not be_valid
      end
    end

    context "api_root is blank" do
      let(:api_root) { nil }

      it "is false" do
        expect(config).to_not be_valid
      end
    end

    context "partner_name is blank" do
      let(:partner_name) { nil }

      it "is false" do
        expect(config).to_not be_valid
      end
    end

    context "partner_password is blank" do
      let(:partner_password) { nil }

      it "is false" do
        expect(config).to_not be_valid
      end
    end

    context "source_url is blank" do
      let(:source_url) { nil }

      it "is false" do
        expect(config).to_not be_valid
      end
    end

    context "debug is true" do
      let(:debug) { true }

      context "logger is blank" do
        let(:logger) { nil }

        it "is false" do
          expect(config).to_not be_valid
        end
      end

      context "logger is set" do
        let(:logger) { Logger.new(STDOUT) }

        it "is true" do
          expect(config).to be_valid
        end
      end
    end
  end
end

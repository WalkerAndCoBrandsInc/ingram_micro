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

  it 'sets body logger' do
    config.log_request_body = true

    expect(config.log_request_body).to eq true
  end

  it 'sets logger' do
    config.logger = Logger.new(STDOUT)

    expect(config.logger).to be_a Logger
  end

  it 'sets partner name' do
    config.partner_name = 'walker and co'

    expect(config.partner_name).to eq 'walker and co'
  end

  it "sets partner password" do
    config.partner_password = "password"

    expect(config.partner_password).to eq "password"
  end

  it "sets customer id" do
    config.customer_id = "123"

    expect(config.customer_id).to eq "123"
  end

  it "sets proxy" do
    config.proxy = "localhost:8888"

    expect(config.proxy).to eq("localhost:8888")
  end

  describe '#assert_valid' do
    let(:configuration) { IngramMicro::Configuration.new }

    context 'when everything is valid' do
      before do
        configuration.api_root = 'not empty'
        configuration.partner_name = 'not empty'
        configuration.partner_password = 'exists'
        configuration.customer_id = '123'
      end

      it 'does not raise' do
        expect { configuration.assert_valid }.to_not raise_error
      end

      context 'debug and logger are set' do
        before do
          configuration.debug = true
          configuration.logger = :my_logger
        end

        it 'does not raise when logger is set' do
          expect { configuration.assert_valid }.to_not raise_error
        end
      end
    end

    context "when it's not valid" do
      before do
        configuration.api_root = 'not empty'
        configuration.partner_name = 'not empty'
        configuration.partner_password = 'exists'
        configuration.customer_id = '123'
      end

      it 'fails when there is no partner_name' do
        configuration.partner_name = nil
        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'partner_name is required')
      end

      it 'fails when there is no api_root' do
        configuration.api_root = nil
        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'api_root is required')
      end

      it 'fails when there is no customer_id' do
        configuration.customer_id = nil
        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'customer_id is required')
      end

      it 'fails when debug is set without logger' do
        configuration.debug = true
        configuration.logger = nil

        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'logger must be set if debug is set')
      end

      it 'fails when customer_id is non-integer' do
        configuration.customer_id = 'not integery'

        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'customer_id must be an integer')
      end

      it 'fails when proxy does not have protocol' do
        configuration.proxy = 'localhost:8888'

        expect { configuration.assert_valid }.to raise_error(IngramMicro::Configuration::Error, 'proxy must have protocol http://')
      end
    end
  end
end

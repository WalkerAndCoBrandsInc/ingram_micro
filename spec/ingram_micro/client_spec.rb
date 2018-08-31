require 'spec_helper'

describe IngramMicro::Client do

  let(:client) { IngramMicro::Client.new }

  describe "#initialize" do
    context "creates Faraday connection" do
      it "initializes a Faraday connection" do
        expect(client.conn).to be_a(Faraday::Connection)
      end

      context "configuration has no proxy set" do
        before do
          IngramMicro.configuration.proxy = nil
        end

        it "does not set proxy on client" do
          proxy = client.conn.proxy

          expect(proxy).to be_nil
        end
      end

      context "configuration has proxy set" do
        before do
          IngramMicro.configuration.proxy = "localhost:8888"
        end

        it "sets proxy on faraday client" do
          proxy = client.conn.proxy

          expect(proxy).to_not be_nil
          expect(proxy.uri.to_s).to eq(IngramMicro.configuration.proxy)
        end
      end

      context "when passing ssl options" do
        before do
          IngramMicro.configuration.ssl_options = {
            certificate: file
          }
        end

        let(:file) { double(File) }

        it 'builds a connection with ssl' do
          ssl = client.conn.ssl
          expect(ssl).to_not be_nil
          expect(ssl.certificate).to eq(file)
        end
      end
    end
  end
end

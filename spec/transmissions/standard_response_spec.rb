require 'spec_helper'

describe IngramMicro::StandardResponse do

  let(:empty_standard_response) { IngramMicro::StandardResponse.new }
  let(:populated_standard_response) { Fabricate.build(:standard_response) }

  describe '#initialize' do
    context 'with no data passed in' do
      it 'should still create a valid StandardResponse object' do
        expect(empty_standard_response).to be_truthy
      end
    end
    context 'with data passed in' do
      it 'should create a valid StandardResponse object with the data passed in' do
        expect(populated_standard_response).to be_truthy
      end
    end
  end

  describe '#build' do
    context 'with data passed in' do
      it 'should create an xml form' do
        expect(populated_standard_response.xml_builder).to be_truthy
      end
    end
  end

  describe '#schema_valid?' do
    context 'with data passed in' do
      it 'validates output xml using StandardResponse schema' do
        expect(populated_standard_response.schema_valid?).to be true
      end
    end
  end

  describe 'xml_builder' do
    context 'populated standard response' do
      it 'generates xml' do
        expect(populated_standard_response.xml_builder.to_xml).to have_xml('/message/message-header/transaction-name', 'standard-response')
      end
    end
  end
end

require 'spec_helper'

describe IngramMicro::ReturnAuthorization do

  let(:ra_no_info) { IngramMicro::ReturnAuthorization.new }
  let(:return_auth_with_info) { Fabricate.build(:return_authorization) }

  describe '#build' do

    context 'with data entered' do
      it 'raises an error' do
        require 'pry'
        binding.pry
        expect(return_auth_with_info.schema_valid?).to be true
      end
    end
  end
end

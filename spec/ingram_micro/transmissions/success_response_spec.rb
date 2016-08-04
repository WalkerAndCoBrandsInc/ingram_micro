require 'spec_helper'

describe IngramMicro::SuccessResponse do
  let(:empty_success_response) { IngramMicro::SuccessResponse.new }
  let(:standard_response_attributes) { {transaction_name: 'some-cool-msg',
                                        comments: 'huge-comments',
                                        response_timestamp: Time.now.strftime('%Y%m%d%H%M%S')} }

  describe '#initialize' do
    context 'with no data passed in' do
      it 'should still create a valid StandardResponse object with a failure status' do
        expect(empty_success_response).to be_truthy
        expect(empty_success_response.status_code). to be 0
        expect(empty_success_response.status_description). to be IngramMicro::SuccessResponse::DESCRIPTION
      end
    end

    context 'with data passed in' do
      it 'should create a valid StandardResponse object with a failure status and data passed in' do
        populated_success_response = IngramMicro::SuccessResponse.new(standard_response_attributes)

        expect(populated_success_response).to be_truthy
        expect(populated_success_response.status_code). to be 0
        expect(populated_success_response.status_description). to be IngramMicro::SuccessResponse::DESCRIPTION
      end
    end
  end
end
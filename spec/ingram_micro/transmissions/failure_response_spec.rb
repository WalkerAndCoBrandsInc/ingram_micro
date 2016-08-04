require 'spec_helper'

describe IngramMicro::FailureResponse do
  let(:empty_failure_response) { IngramMicro::FailureResponse.new }
  let(:standard_response_attributes) { {transaction_name: 'some-cool-msg',
                                        comments: 'huge-comments',
                                        response_timestamp: Time.now.strftime('%Y%m%d%H%M%S')} }

  describe '#initialize' do
    context 'with no data passed in' do
      it 'should still create a valid StandardResponse object with a failure status' do
        expect(empty_failure_response).to be_truthy
        expect(empty_failure_response.status_code). to be -1
        expect(empty_failure_response.status_description). to be IngramMicro::FailureResponse::DESCRIPTION
      end
    end

    context 'with data passed in' do
      it 'should create a valid StandardResponse object with a failure status and data passed in' do
        populated_failure_response = IngramMicro::FailureResponse.new(standard_response_attributes)

        expect(populated_failure_response).to be_truthy
        expect(populated_failure_response.status_code). to be -1
        expect(populated_failure_response.status_description). to be IngramMicro::FailureResponse::DESCRIPTION
      end
    end
  end
end
require 'spec_helper'

describe IngramMicro::InboundBaseElement do
  it 'is equal to another instance if the input hashes are equal' do
    a = IngramMicro::InboundBaseElement.new({a: 1})
    b = IngramMicro::InboundBaseElement.new({a: 1})

    expect(a).to eq b
  end

  it 'is not equal to another instance with a different input hash' do
    a = IngramMicro::InboundBaseElement.new({a: 1})
    b = IngramMicro::InboundBaseElement.new({a: 2})

    expect(a).not_to eq b
  end

  it 'is not equal to members of another InboundBaseElement subclass' do
    class Subclass < IngramMicro::InboundBaseElement; end

    a = Subclass.new({a: 1})
    b = IngramMicro::InboundBaseElement.new({a: 1})

    expect(a).not_to eq b
  end

  it 'has a transaction_type' do
    element = IngramMicro::InboundBaseElement.new({
      'message' => {
        'message_header' => {
          'transaction_name' => 'some-transaction-name'
        }
      }
    })

    expect(element.transaction_name).to eq 'some-transaction-name'
  end
end

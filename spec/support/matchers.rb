RSpec::Matchers.define :have_xml do |xpath, text|
  require 'nokogiri'
  match do |body|
    elems = Nokogiri::XML(body).xpath(xpath)
    if elems
      elems.select do |elem|
        elem.text == text
      end.any?
    else
      false
    end
  end

  failure_message do |body|
    "expected to find xml tag #{xpath} with text #{text} in:\n#{Nokogiri::XML(body).to_xml(indent: 2)}"
  end

  failure_message_when_negated do |body|
    "expected not to find xml tag #{xpath} with text #{text} in:\n#{Nokogiri::XML(body).to_xml(indent: 2)}"
  end

  description do
    "have xml tag #{xpath}"
  end
end

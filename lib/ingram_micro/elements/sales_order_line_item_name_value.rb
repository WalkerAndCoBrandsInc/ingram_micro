module IngramMicro
  class SalesOrderLineItemNameValue < BaseElement
    ACCEPTABLE_ATTRIBUTE_NAMES = [
      "international-eccn-value",
      "international-declared-value",
      "warranty-item",
      "international-country-of-origin",
      "international-license-value",
      "hts-code"
    ].freeze

    DEFAULTS = {
      :name => nil,
      :value => nil
    }.freeze

    def build(builder)
      name, value = element[:name], element[:value]
      if ACCEPTABLE_ATTRIBUTE_NAMES.include?(name)
        builder.send('line-name-value') do
          builder.send('line-attribute-name', name)
          builder.send('line-attribute-value', value)
        end
      else
        raise ArgumentError, "Invalid attribute name: #{name}"
      end
    end

    def defaults
      DEFAULTS
    end
  end
end

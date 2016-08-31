module IngramMicro
  class SalesOrderHeaderNameValue < BaseElement
    HEADER_ATTRIBUTE_NAMES = [
      "international-duties-and-taxes-billing-to",
      "international-freight-billing-to",
      "international-freight-account",
      "international-incoterm",
      "international-importer-of-record-email",
      "international-importer-of-record-phone-number",
      "international-importer-of-record-country-code",
      "international-importer-of-record-zipcode",
      "international-importer-of-record-state",
      "international-importer-of-record-city",
      "international-importer-of-record-address3",
      "international-importer-of-record-address2",
      "international-importer-of-record-address1",
      "international-importer-of-record-name"
    ].freeze

    DEFAULTS = {
      name: nil,
      value: nil
    }.freeze

    def defaults
      DEFAULTS
    end

    def build(builder)
      if HEADER_ATTRIBUTE_NAMES.include?(element[:name])
        name, value = element[:name], element[:value]
        builder.send('header-name-value') do
            builder.send('attribute-name', name)
            builder.send('attribute-value', value)
        end
      else
        raise ArgumentError, "Header attribute #{name} is invalid."
      end
    end
  end
end

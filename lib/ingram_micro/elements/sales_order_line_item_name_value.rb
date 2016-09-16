module IngramMicro
  class SalesOrderLineItemNameValue < BaseElement

    # Each key in DEFAULTS maps to a valid line-attribute-name for this element.
    # Values are passed in via the options hash.
    # For example, if the options include {warranty_item: 'true'}, you'll get:
    # <line-name-value>
    #   <line-attribute-name>warranty-item</line-attribute-name>
    #   <line-attribute-value>true</line-attribute-value>
    # </line-name-value>
    DEFAULTS = {
      international_eccn_value: nil,
      international_declared_value: nil,
      warranty_item: nil,
      international_country_of_origin: nil,
      hts_code: nil
    }

    def defaults
      DEFAULTS
    end

    def build(builder)
      element.each do |field, value|
        xml_name = field.to_s.tr("_","-")
        builder.send('line-name-value') do
          builder.send('line-attribute-name', xml_name)
          builder.send('line-attribute-value', value)
        end
      end
    end
  end
end

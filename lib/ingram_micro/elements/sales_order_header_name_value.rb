module IngramMicro
  class SalesOrderHeaderNameValue < BaseElement

    # Each key in DEFAULTS maps to a valid attribute-name for this element.
    # Values are passed in via the options hash.
    # For example, if the options include {international_incoterm: 'ABC'}, you'll get:
    # <header-name-value>
    #   <attribute-name>international-incoterm</attribute-name>
    #   <attribute-value>'ABC'</attribute-value>
    # </header-name-value>

    DEFAULTS = {
      international_duties_and_taxes_billing_to: nil,
      international_freight_billing_to: nil,
      international_freight_account: nil,
      international_incoterm: nil,
      international_importer_of_record_email: nil,
      international_importer_of_record_phone_number: nil,
      international_importer_of_record_country_code: nil,
      international_importer_of_record_zipcode: nil,
      international_importer_of_record_state: nil,
      international_importer_of_record_city: nil,
      international_importer_of_record_address3: nil,
      international_importer_of_record_address2: nil,
      international_importer_of_record_address1: nil,
      international_importer_of_record_name: nil
    }.freeze

    def defaults
      DEFAULTS
    end

    def build(builder)
      element.each do |field, value|
        xml_name = field.to_s.tr("_","-")
        builder.send('header-name-value') do
          builder.send('attribute-name', xml_name)
          builder.send('attribute-value', value)
        end
      end
    end
  end
end

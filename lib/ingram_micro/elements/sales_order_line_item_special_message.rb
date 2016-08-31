module IngramMicro
  class SalesOrderLineItemSpecialMessage < BaseElement
    DEFAULTS = {
      engraving_location: nil,
      engraving_font: nil,
      special_message1: nil,
      special_message2: nil,
      special_message3: nil,
      special_message4: nil,
      special_message5: nil,
      special_message6: nil
    }.freeze

    def build(builder)
      el_copy = element
      builder.send('special-message') do
        el_copy.each do |field, value|
          field_name = field.to_s.tr("_","-")
          builder.send(field_name, value) unless value.nil?
        end
      end
    end

    def defaults
      DEFAULTS
    end
  end
end

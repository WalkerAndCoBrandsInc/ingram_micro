class IngramMicro::BaseElement
  attr_accessor :element

  def initialize(options={})
    @element = {}
    self.defaults.each do |field, default|
      value = (options[field] ? options[field] : default)
      @element[field] = value
    end
  end

  # build goes through defaults (defined for each element that inherits from
  # BaseElement) and checks to see if a value for that field has been passed in.
  # If no value was passed in, the field will be assigned the default value.
  # The fields are being added to builder, which is a Nokogiri XML Builder
  # object that can output an xml document (which gets sent to Ingram Micro).
  def build(builder)
    self.defaults.keys.each do |field|
      element_name = field.to_s.gsub('_', '-')
      element_value = formatted_value_of(field)
      builder.send(element_name, element_value)
    end
  end

  def self.format(field, formatter)
    @formatters ||= {}
    @formatters[field] = formatter
  end

  private

  def self.formatter_for(field)
    if @formatters && @formatters[field]
      @formatters[field]
    else
      IngramMicro::NullFormatter.new
    end
  end

  def formatted_value_of(field)
    self.class.formatter_for(field).format(@element[field])
  end

  def integer?(string)
    Integer(string) != nil rescue false
  end
end

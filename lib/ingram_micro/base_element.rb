class IngramMicro::BaseElement
  attr_accessor :element

  def initialize(options={})
    @element = {}
    self.defaults.each do |field, default|
      value = (options[field] ? options[field] : default)
      @element[field] = value
    end
    @element[:customer_id] ||= IngramMicro.configuration.customer_id
  end

  def build(builder)
    self.defaults.keys.each do |field|
      element_name = field.to_s.gsub('_', '-')
      element_value = formatted_value_of(field)
      builder.send(element_name, element_value)
    end
  end

  def parse(message_hash)
    defaults.each do |field|
      element_name = field.to_s.gsub('_', '-')
      @element[field] = message_hash[element_name]
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

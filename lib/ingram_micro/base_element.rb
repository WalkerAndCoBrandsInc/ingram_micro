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
      element_value = @element[field]
      builder.send(element_name, element_value)
    end
  end

  def parse(message_hash)
    defaults.each do |field|
      element_name = field.to_s.gsub('_', '-')
      @element[field] = message_hash[element_name]
    end
  end

  def integer?(string)
    Integer(string) != nil rescue false
  end
end

class IngramMicro::BaseElement

  attr_accessor :element

  def initialize(options={})
    @element = {}
    self.defaults.each do |field, default|
      value = (options[field] ? options[field] : default)
      @element[field] = value
    end
  end

  def build(builder)
    self.defaults.keys.each do |field|
      element_name = field.to_s.gsub("_", "-")
      element_value = @element[field]
      builder.send(element_name, element_value)
    end
  end

  def method_missing(methId)
    return element[methId] if element[methId]
  end

end

class IngramMicro::Detail < IngramMicro::BaseElement

  DEFAULTS = {
    line_items: []
  }

  def defaults
    DEFAULTS
  end

  def build(builder)
    @element[:line_items].each_with_index do |line_item, idx|
      line_item.line_no = idx + 1 if line_item.line_no.nil?
      builder.send('line-item') do
        line_item.build(builder)
      end
    end
  end
end

class IngramMicro::SalesOrderDetail < IngramMicro::BaseElement

  DEFAULTS = {
    line_items: []
  }

  def defaults
    DEFAULTS
  end

  def build(builder)
    # Add new line item if there isn't one? Or should empty line_items give an error?
    #
    # if @element[:line_items].empty?
    #   line_item = IngramMicro::SalesOrderLineItem.new
    #   @element[:line_items] << line_item
    # end
    @element[:line_items].each_with_index do |line_item, idx|
      line_item.line_no = idx + 1 if line_item.line_no.nil?
      puts line_item.line_no
      builder.send("line-item") do
        line_item.build(builder)
      end
    end
  end

end

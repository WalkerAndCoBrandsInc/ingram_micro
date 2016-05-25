class IngramMicro::SalesOrderDetail

  attr_accessor :line_items

  def initialize(options={})
    @line_items = (options[:line_items] ? options[:line_items] : [])
  end

  def build(builder)
    @line_items.each_with_index do |line_item, idx|
      line_item.line_no = idx + 1 if line_item.line_no.nil?
      builder.send("line-item") do
        line_item.build(builder)
      end
    end
  end

end

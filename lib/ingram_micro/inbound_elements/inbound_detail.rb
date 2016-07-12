class IngramMicro::InboundDetail < IngramMicro::InboundBaseElement

  def line_items
    if hash['line_item'].is_a?(Array)
      hash['line_item'].map do |line_item|
        IngramMicro::InboundLineItem.new(line_item)
      end
    else
      [IngramMicro::InboundLineItem.new(hash['line_item'])]
    end
  end
end

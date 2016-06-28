class IngramMicro::DateFormatter
  def format(date)
    if date.respond_to?(:strftime)
      date.strftime('%Y%m%d')
    else
      date
    end
  end
end

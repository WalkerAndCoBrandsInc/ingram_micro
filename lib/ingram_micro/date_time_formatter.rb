class IngramMicro::DateTimeFormatter
  def format(datetime)
    if datetime.respond_to?(:strftime)
      datetime.strftime('%Y%m%d%H%M%S')
    else
      datetime
    end
  end
end

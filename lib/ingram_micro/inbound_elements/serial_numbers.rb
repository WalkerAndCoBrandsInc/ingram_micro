class IngramMicro::SerialNumbers < IngramMicro::InboundBaseElement

  def min
    hash['min']
  end

  def sid
    hash['sid']
  end

  def mdn
    hash['mdn']
  end

  def esn
    hash['esn']
  end

  def sim
    hash['sim']
  end

  def imei
    hash['imei']
  end

  def sublock1
    hash['sublock1']
  end

  def sublock2
    hash['sublock2']
  end

  def sublock3
    hash['sublock3']
  end

  def irdb
    hash['irdb']
  end

  def meid
    hash['meid']
  end

  def iccid
    hash['iccid']
  end

  def macid
    hash['macid']
  end

  def pesn
    hash['pesn']
  end
end

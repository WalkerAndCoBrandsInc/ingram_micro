class IngramMicro::InboundBaseElement
  attr_accessor :hash

  def initialize(hash)
    @hash = hash
  end

  def ==(other)
    self.class == other.class &&
      @hash == other.hash
  end
end

class IngramMicro::Customer
  attr_accessor :first_name, :last_name, :email, :middle_initial, :address1,
    :address2, :address3, :city, :state, :post_code, :country_code, :phone1,
    :phone2, :fax

  def valid?
    true
  end

  def build(builder, prefix = 'customer')
    builder.send("#{prefix}-first-name", first_name)
    builder.send("#{prefix}-last-name", last_name)
    builder.send("#{prefix}-middle-initial", middle_initial)
    builder.send("#{prefix}-address1", address1)
    builder.send("#{prefix}-address2", address2)
    builder.send("#{prefix}-address3", address3)
    builder.send("#{prefix}-city", city)
    builder.send("#{prefix}-state", state)
    builder.send("#{prefix}-post-code", post_code)
    builder.send("#{prefix}-country-code", country_code)
    builder.send("#{prefix}-phone1", phone1)
    builder.send("#{prefix}-phone2", phone2)
    builder.send("#{prefix}-fax", fax)
    builder.send("#{prefix}-email", email)
  end
end

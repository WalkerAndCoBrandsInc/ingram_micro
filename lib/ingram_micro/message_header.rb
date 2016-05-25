class IngramMicro::MessageHeader

  DEFAULTS = {
    :message_id => 0,
    :transaction_name => nil,
    :partner_name => nil,
    :partner_password => nil,
    :source_url => nil,
    :create_timestamp => nil,
    :response_request => 1
  }

  DEFAULTS.keys.each{|field| attr_accessor field}

  def initialize(options={})
    DEFAULTS.each do |field, default|
      value = (options[field] ? options[field] : default)
      instance_variable_set("@#{field}", value)
    end
    use_current_date?
  end

  def build(builder)
    DEFAULTS.keys.each do |field|
      element_name = field.to_s.gsub("_", "-")
      element_value = instance_variable_get("@#{field}")
      builder.send(element_name, element_value)
    end
  end


  # def build(builder)
  #   builder.send("message-header") do
  #     builder.send "message-id", 123
  #     builder.send "transaction-name",
  #     builder.send "partner-name", IngramMicro.configuration.partner_name
  #     builder.send "partner-password", IngramMicro.configuration.partner_password
  #     builder.send "source-url", IngramMicro.configuration.source_url
  #     builder.send "create-timestamp", DateTime.now
  #     builder.send "response-request", 1
  #   end
  # end

  def use_current_date?
      if @customer_order_date.nil?
        @customer_order_date = DateTime.now.strftime("%Y%m%d")
      end
    end

end

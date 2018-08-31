require 'yaml'

module IngramMicro
  class Configuration
    attr_accessor :api_root, :debug, :logger,
      :partner_name, :partner_password, :international_schema,
      :log_request_body, :customer_id, :proxy, :timeout, :open_timeout,
      :ssl_options

    def assert_valid
      assert_present :partner_name
      assert_present :api_root
      assert_present :customer_id
      fail Error.new('logger must be set if debug is set') unless logger_valid?
      fail Error.new('customer_id must be an integer') unless customer_id_valid?
      fail Error.new('proxy must have protocol http://') unless proxy_valid?
    end

    private

    def assert_present(field_name)
      fail Error.new("#{field_name} is required") unless present?(field_name)
    end

    def logger_valid?
      return true unless debug

      present?(:logger)
    end

    def customer_id_valid?
      customer_id.to_s =~ /^\d+$/
    end

    def proxy_valid?
      return true if proxy.nil?

      proxy =~ /^http:\/\//
    end

    def present?(field_name)
      !send(field_name).nil?
    end

    class Error < StandardError; end
  end
end

require 'yaml'

module IngramMicro
  class Configuration
    attr_accessor :api_root, :debug, :logger, :ca_file,
      :partner_name, :partner_password, :source_url

    def valid?
      present?(partner_name) &&
      present?(partner_password) &&
      present?(source_url) &&
      present?(api_root) &&
        present?(ca_file) &&
        logger_valid?
    end

    private

    def logger_valid?
      return true unless debug

      present?(logger)
    end

    def present?(value)
      !value.nil?
    end
  end
end

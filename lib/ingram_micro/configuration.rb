module IngramMicro
  class Configuration
    attr_accessor :api_root, :debug, :logger, :ca_file

    def valid?
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

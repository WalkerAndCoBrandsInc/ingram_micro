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

    def initialize
      defaults = load_defaults
      @api_root = defaults[:api_root]
      @api_version = defaults[:api_version]
      @content_type = defaults[:content_type]
      @ca_path = defaults[:ca_path]
      @debug = false
    end

    private

    def load_defaults
      YAML.load_file(File.join(File.dirname(__FILE__),'..','config','defaults.yml'))
    end

    def logger_valid?
      return true unless debug

      present?(logger)
    end

    def present?(value)
      !value.nil?
    end
  end
end

require 'uri'
class IngramMicro::Client

  attr_reader :uri, :conn

  def initialize(url=api_root)
    @uri = URI.parse(url)
    @conn = Faraday.new(faraday_initializer_args) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger, logger, bodies: log_request_body
      faraday.adapter  Faraday.default_adapter
      faraday.proxy proxy if proxy
    end
  end

  def get
    conn.get uri.request_uri
  end

  def post(data)
    conn.post do |req|
      req.url uri.request_uri
      req.headers['Content-Type'] = 'application/xml'
      req.body = data
      req.options.timeout = configuration.timeout
      req.options.open_timeout = configuration.open_timeout
    end
  end

  private

  def faraday_initializer_args
    {
      url: uri,
    }.tap do |hash|
      hash[:ssl] = configuration.ssl_options if configuration.ssl_options
    end
  end

  def api_root
    configuration.api_root
  end

  def logger
    configuration.logger
  end

  def log_request_body
    configuration.log_request_body
  end

  def proxy
    configuration.proxy
  end

  def configuration
    IngramMicro.configuration
  end
end

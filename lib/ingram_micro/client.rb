require 'pry'
class IngramMicro::Client

  attr_reader :uri, :conn

  def initialize(url=default_url)
    @uri = URI.parse(url)
    @conn = Faraday.new(:url => uri) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def default_url
    IngramMicro.configuration.api_root
  end

  def get
  end

  def post(data)
    conn.post do |req|
      req.url uri.request_uri
      req.headers['Content-Type'] = 'application/xml'
      req.body = data
    end
  end

end

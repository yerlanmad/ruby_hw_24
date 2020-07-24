require 'net/http'

class Query
  attr_reader :uri, :response

  def get(url, headers = {})
    self.uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.instance_of?(URI::HTTPS)

    request = Net::HTTP::Get.new(uri)
    headers.each { |key, value| request[key] = value }

    self.response = http.request(request)
    response
  end

  def resp_code
    response.code if response
  end

  def resp_body
    response.body if response
  end

  def resp_headers
    response.each_header { |key, value| p "#{key}: #{value}" } if response
  end
  
  private

  attr_writer :uri, :response
end

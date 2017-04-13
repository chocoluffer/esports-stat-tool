def self.get(url, opts = {})
  uri = URI.parse(url)
  uri.query = URI.encode_www_form(opts[:params]) if !opts[:params].nil?
  http = Net::HTTP.new(uri.host, uri.port)
  # http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)
  request['Cookie'] = opts[:cookies] if !opts[:cookies].nil?
  request.initialize_http_header(opts[:headers]) if !opts[:headers].nil?
  response = http.request(request)

  JSON.parse(response.body)
end

def self.post(url, opts={})
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path)
  request.initialize_http_header(opts[:headers]) if !opts[:headers].nil?
  http.use_ssl = true if uri.scheme == 'https'
  request.set_form_data(opts[:form_data]) if !opts[:form_data].nil?
  response = http.request(request)

  JSON.parse(response.body)
end
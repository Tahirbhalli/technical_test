require 'uri'
require 'dotenv'

module ProcessUrl
  def build_url(route)
    @data = Dotenv.load
    @url = URI(@data['API_URL'] + route)
    params = { key: @data['API_KEY'] }
    @url.query = URI.encode_www_form(params)
    @url
  end

  def add_query(query_hash)
    params = URI.decode_www_form(@url.query)
    query_hash.each do |key, value|
      params << [key, value]
    end
    @url.query = URI.encode_www_form(params)
    @url
  end
end

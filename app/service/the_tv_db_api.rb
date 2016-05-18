class TheTvDbApi
  BASE_URL = 'https://api.thetvdb.com'

  def self.request_token
    response = connection.post do |req|
      req.url '/login'
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'

      req.body = {
          apikey: ENV['TV_DB_API_KEY'],
          username: ENV['TV_DB_USER_NAME'],
          userkey: ENV['TV_DB_USER_KEY']
        }.to_json
    end

    jwt_token = JSON::parse(response.body)['token']
    JwtToken.create(
        token: jwt_token,
        expiration_date: 23.hours.from_now
      )
  end

  def self.refresh_token
    response = get_response '/refresh_token'
  end

  def self.update_series
    from_date = 65.minutes.ago.to_i
    url = "/updated/query?fromTime=#{from_date}"
    response = get_response url

    series = JSON::parse(response.body)['data']
    series.each do |serie|
      serie_info = get_serie serie['id']
    end
    binding.pry
  end

  def self.get_serie serie_id
    response = get_response "/series/#{series_id}"
    JSON::parse(response.body)['data']
  end

  private
  def self.connection
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.get_response url
    token = JwtToken.last.token
    connection.get do |req|
      req.url url
      req.headers['Accept'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{token}"
    end
  end
end

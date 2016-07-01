class TraktTvApi
  BASE_URL = 'https://api-v2launch.trakt.tv'.freeze

  def self.trending limit = 100, page = 1
    request BASE_URL + "/shows/trending?limit=#{limit}&page=#{page}"
  end

  def self.popular limit = 100, page = 1
    request BASE_URL + "/shows/popular?limit=#{limit}&page=#{page}"
  end

  def self.request url
    return if url.blank?

    headers = {
      content_type: 'application/json',
      trakt_api_version: '2',
      trakt_api_key: ENV['TRAKT_API_KEY']
    }

    response = RestClient.get url, headers
    JSON.parse response
  end
end

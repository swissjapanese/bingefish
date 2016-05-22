class StaticPagesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @shows = TheTvDbApi.search(@query).map do |show|
        serie = Show.find_by(tvdb_id: show['id'])
        if serie.nil?
          details = TheTvDbApi.get_serie show['id']
          images = TheTvDbApi.get_serie_fanart show['id']

          serie = Show.create(
              tvdb_id: details['id'],
              imdb_id: details['imdbId'],
              title: details['seriesName'],
              plot: details['overview'],
              genre: details['genre'].join[', ']
            )

          ShowImage.create(
              image_type: 'poster',
              remote_image_url: "http://www.thetvdb.com/banners/#{images.last['fileName']}",
              show: serie
            )
        end

        serie
      end

    end
  end
end

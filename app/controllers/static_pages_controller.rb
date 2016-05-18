class StaticPagesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @shows = TheTvDbApi.search(@query).map do |show|
        details = TheTvDbApi.get_serie show['id']
        images = TheTvDbApi.get_serie_fanart show['id']

        {
          poster: images.first['fileName'],
          name: show['seriesName'],
          overview: show['overview'],
          genre: details['genre'].join(', ')
        }
      end

    end
  end
end

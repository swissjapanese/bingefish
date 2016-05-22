class StaticPagesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @shows = TheTvDbApi.search(@query).map do |show|
        details = TheTvDbApi.get_serie show['id']
        images = TheTvDbApi.get_serie_fanart show['id']

        binding.pry
        serie = {
          name: show['seriesName'],
          overview: show['overview'],
          genre: details['genre'].join(', ')
        }

        if images.present?
          serie.merge! poster: images.last['fileName']
        end
        serie
      end

    end
  end
end

class SearchesController < ApplicationController
  def index
    @shows =
      Show.
        where('series_name like ?', "%game%").
        order(popularity_rank: :desc).
        limit(30)
    @shows = @shows.map do |show|
      SearchResultPresenter.prepare show
    end
  end
end

module API
  class SearchController < ApplicationController
    def index
      render json: { } and return if params[:query].blank?

      shows =
        Show.
          where('series_name like ?', "%#{params[:query]}%").
          order(popularity_rank: :asc).
          limit(28)
      shows = shows.map do |show|
        SearchResultPresenter.prepare show
      end

      render json: shows.as_json, status: :ok
    end
  end
end

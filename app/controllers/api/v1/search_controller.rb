module API::V1
  class SearchController < ApplicationController
    def index
      render json { }, status: :ok if params[:query].nil?

      shows =
        Show.
          where('series_name like ?', "%#{params[:query]}%").
          order(popularity_rank: :desc)
      shows = shows.map do |show|
        SearchResultPresenter.prepare show
      end
      render json: shows.as_json, status: :ok
    end
  end
end

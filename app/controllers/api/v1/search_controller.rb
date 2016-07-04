module API::V1
  class SearchController < ApplicationController
    def index
      render json { }, status: :ok if params[:query].nil?

      shows =
        Show.
          where('series_name like ?', "%#{params[:query]}%").
          order(popularity_rank: :desc)
      shows.map! { |show| SearchResultPresenter.prepare show }
      render json: show.as_json, status: :ok
    end
  end
end

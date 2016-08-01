module API::V1
  class ShowsController < ApplicationController
    before_action :set_show, only: [:show]

    def show
      render(
          json: DetailedShowPresenter.prepare(@show),
          status: :ok
        )
    end

    private
    def set_show
      @show = Show.find_by id: params[:id]
    end
  end
end

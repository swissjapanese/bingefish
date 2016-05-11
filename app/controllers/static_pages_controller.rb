class StaticPagesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @shows =
        Show.
          where("lower(title) like '%#{@query}%'").
          order(year: :desc).
          page params[:page]
    end
  end
end

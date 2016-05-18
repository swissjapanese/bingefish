class StaticPagesController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @shows =
        Show.
          where("lower(title) like '%#{@query.downcase}%'").
          where(show_type: 'series').
          order(year: :desc).
          page params[:page]
    end
  end
end

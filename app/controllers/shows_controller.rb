class ShowsController < ApplicationController
  before_action :set_show, only: [:show]

  def index
  end

  def show
    @show = DetailedShowPresenter.prepare @show
  end

  private
  def set_show
    @show = Show.find_by id: params[:id]
  end
end
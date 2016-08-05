module API
  class BingeListController < ApplicationController
    before_action :authenticate_user!
    before_action :set_list_params, only: [:update]
    before_action :set_show
    before_action :set_binge_list

    def show
      headers['Last-Modified'] = Time.now.httpdate
      list = BingeListItemPresenter.prepare(@list)
      render json: list, status: :ok
    end

    def update
      @list.assign_attributes @list_params
      @list.updated = @list_params['binge'] unless @list_params['binge'].nil?
      if @list.save
        list = BingeListItemPresenter.prepare(@list)
        render json: list, status: :ok
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    private
    def set_binge_list
      @list =
        BingeList.
          find_or_initialize_by(
              user: current_user,
              show: @show
            )
    end

    def set_show
      @show = Show.find_by id: params[:id]
    end

    def set_list_params
      @list_params =
        params.
          require(:binge_list).
          permit(:binge, :watchlist, :guilty, :updated)

      @list_params = @list_params.each do |key, value|
          @list_params[key] = value == 'true'
        end
    end
  end
end

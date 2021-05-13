class SearchesController < ApplicationController
  def index
    @trains = Train.where(route_id: search_route_id)
    @start_station = params[:start_station]
    @finish_station = params[:finish_station]
  end

  private

  def search_route_id
    Route.by_start_and_finish(params[:start_station], params[:finish_station])
  end
end

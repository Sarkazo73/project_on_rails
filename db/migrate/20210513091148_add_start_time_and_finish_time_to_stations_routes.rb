class AddStartTimeAndFinishTimeToStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    add_column :railway_stations_routes, :start_time, :time
    add_column :railway_stations_routes, :finish_time, :time
  end
end

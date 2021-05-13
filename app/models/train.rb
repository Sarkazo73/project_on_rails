class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def renumber
    carriages.order(:train_number).each_with_index do |carriage, index|
      carriage.update_column(:train_number, index + 1)
    end
  end

  def get_station(station)
    route.railway_stations_routes.find_by(railway_station_id: station)
  end
end


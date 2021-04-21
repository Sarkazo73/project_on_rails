class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
  validate :station_count

  before_validation :set_name
  before_validation :add_number

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def add_number
    railway_stations_routes.each_with_index do |station_route, index|
      station_route.station_number = index
    end
  end

  def station_count
    if railway_stations.size < 2
      error.add(:base, "Route should contain at last 2 stations")
    end
  end
end

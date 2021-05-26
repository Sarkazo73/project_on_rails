class Route < ApplicationRecord
  has_many :railway_stations_routes, autosave: true
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :station_count

  after_validation :set_name
  before_save :add_number

  scope :by_start_and_finish, ->(start_id, finish_id) do
    joins('LEFT JOIN railway_stations_routes as rsr1 on routes.id = rsr1.route_id').
      joins('LEFT JOIN railway_stations_routes as rsr2 on routes.id = rsr2.route_id').
      where(rsr1: {railway_station_id: start_id}, rsr2: {railway_station_id: finish_id}).
      where('rsr1.station_number < rsr2.station_number')
  end

  private

  def add_number
    railway_stations_routes.each_with_index do |station_route, index|
      time = Time.now + (index * 600)
      station_route.station_number = index + 1
      station_route.start_time = time
      station_route.finish_time = time + 100
    end
  end

  def station_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

  def set_name
    if railway_stations.size > 2
      self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end
end

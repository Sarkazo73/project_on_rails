class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

validates :title, presence: true
end
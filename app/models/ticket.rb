class Ticket < ActiveRecord::Base
  validates :number, presence: true

  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
  belongs_to :user
end
class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
  belongs_to :user, optional: true

  validates :passport_number, presence: true
  validates :full_name, presence: true
end
class Carriage < ActiveRecord::Base
  validates :number, :carriage_type, :number_of_seats, presence: true

  belongs_to :train
end
class SeatingCarriage < Carriage

  before_validation :seats_value

  validates :seat_place, presence: true

  private

  def seats_value
    self.seat_place = 60
  end
end

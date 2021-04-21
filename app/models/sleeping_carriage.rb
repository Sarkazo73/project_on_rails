class SleepingCarriage < Carriage

  before_validation :seats_value

  validates :bottom_seats, presence: true

  private

  def seats_value
    self.bottom_seats = 30
  end
end

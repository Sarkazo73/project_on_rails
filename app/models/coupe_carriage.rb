class CoupeCarriage < Carriage

  before_validation :set_seats_numbers

  validates :top_seats, :bottom_seats, presence: true

  private

  def set_seats_numbers
    self.top_seats = 30
    self.bottom_seats = 30
  end
end

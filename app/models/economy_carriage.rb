class EconomyCarriage < Carriage

  before_validation :seats_value

  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  private

  def seats_value
    self.top_seats = 30
      self.bottom_seats = 30
      self.side_top_seats = 30
      self.side_bottom_seats = 30
  end
end

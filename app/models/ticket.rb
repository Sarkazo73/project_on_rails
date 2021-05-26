class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
  belongs_to :user, optional: true

  after_create :send_notification
  before_destroy :send_del_notification

  validates :passport_number, presence: true
  validates :full_name, presence: true

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_del_notification
    TicketsMailer.cancel_buy_ticket(self.user).deliver_now
  end
end
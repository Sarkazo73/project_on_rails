require 'sti_preload'

class Carriage < ActiveRecord::Base
  include StiPreload
  CoupeCarriage
  EconomyCarriage
  SeatingCarriage
  SleepingCarriage

  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :seating, -> { where(type: 'SeatingCarriage') }
  scope :sleeping, -> { where(type: 'SleepingCarriage') }
  scope :order_by_train_number, ->(start_from_head) { order(train_number: (start_from_head ? :asc : :desc)) }

  after_save :renumber_carriages

  private

  def renumber_carriages
    if saved_change_to_train_id?
      Train.find(saved_change_to_train_id.first).renumber
      if train.start_from_head
        self.update_column(:train_number, train.carriages.size)
      else
        self.update_column(:train_number, 0)
        train.renumber
      end
    end
  end
end
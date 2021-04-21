class AddSeatPlaceToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :seat_place, :string
  end
end

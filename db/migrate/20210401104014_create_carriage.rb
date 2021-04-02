class CreateCarriage < ActiveRecord::Migration[6.1]
  def change
    create_table :carriages do |t|
      t.string :number
      t.string :carriage_type
      t.string :number_of_seats

      t.timestamps
    end
  end
end

class AddStartFromHeadToTrains < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :start_from_head, :boolean
  end
end

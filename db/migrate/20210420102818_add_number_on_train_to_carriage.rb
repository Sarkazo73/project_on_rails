class AddNumberOnTrainToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :train_number, :integer
  end
end

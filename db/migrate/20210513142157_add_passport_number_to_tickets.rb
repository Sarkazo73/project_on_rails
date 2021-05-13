class AddPassportNumberToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :passport_number, :integer
  end
end

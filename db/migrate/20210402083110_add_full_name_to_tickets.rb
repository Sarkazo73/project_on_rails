class AddFullNameToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :full_name, :string
  end
end

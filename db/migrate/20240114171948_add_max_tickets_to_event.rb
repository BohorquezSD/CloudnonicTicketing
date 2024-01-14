class AddMaxTicketsToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :max_tickets, :integer, :default => 1
  end
end

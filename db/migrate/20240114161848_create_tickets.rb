class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.string :buyer_name
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end

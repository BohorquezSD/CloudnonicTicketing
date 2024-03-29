User.create(email: 'user1@example.com', password: 'password123', password_confirmation: 'password123', name:"user 1")
User.create(email: 'user2@example.com', password: 'password456', password_confirmation: 'password456', name:"user 2")

# Create events
Event.create(name: "Ruby conf",
description: "Ruby conferences event",
location: "San Diego",
start_time: DateTime.current+ 1.month,
end_time: DateTime.current+ 1.month + 3.days,
ticket_price: 300.5,
max_tickets: 5)

Event.create(name: "Comic con",
description: "Comic con event",
location: "Bogota",
start_time: DateTime.current+ 1.month,
end_time: DateTime.current+ 1.month + 3.days,
ticket_price: 15.0,
max_tickets: 4)



# Create tickets 
Ticket.create(event_id: 1, buyer_name: 'Buyer 1', quantity: 2, total_price: 601.0)
Ticket.create(event_id: 1, buyer_name: 'Buyer 2', quantity: 1, total_price: 300.5)
Ticket.create(event_id: 2, buyer_name: 'Buyer 3', quantity: 3, total_price: 45.0)
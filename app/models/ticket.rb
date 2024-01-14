class Ticket < ApplicationRecord
    belongs_to :event

    
    validates :quantity, numericality: { greater_than: 0, only_integer: true }

    before_create :can_create_ticket_for_event?
    after_create :calculate_total_price
    after_update :calculate_total_price

    private

    def calculate_total_price
        total_price = event.ticket_price * quantity
        update_column(:total_price, total_price)
    end

    def can_create_ticket_for_event?
        if event.tickets.count >= event.max_tickets
            errors.add(:base, 'Can\'t create a ticket for this event, the maximum number of tickets exceeded the capacity limit')
            throw(:abort) 
        end
    end
end

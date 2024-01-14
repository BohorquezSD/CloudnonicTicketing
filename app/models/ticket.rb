class Ticket < ApplicationRecord
    belongs_to :event

    validates :total_price, numericality: { greater_than: 0 }
    validates :quantity, numericality: { greater_than: 0, only_integer: true }

    before_create :can_create_ticket_for_event?

    private

    def can_create_ticket_for_event?
        
        if event.tickets.count >= event.max_tickets
            errors.add(:base, 'Can\'t create a ticket for this event')
            throw(:abort) 
        end
    end
end

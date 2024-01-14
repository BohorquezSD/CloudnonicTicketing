class Event < ApplicationRecord
    has_many :tickets

    validates :name, presence: true, uniqueness: true
    validates :ticket_price, numericality: { greater_than: 0 }
end

class Event < ApplicationRecord
    has_many :tickets

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end

class Event < ApplicationRecord
    has_many :tickets
    belongs_to :user

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end

class Meal < ApplicationRecord
    validates :name, presence: true
    has_many :order_meal
end

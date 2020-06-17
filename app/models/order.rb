class Order < ApplicationRecord
    has_many :order_meal
    belongs_to :user
end

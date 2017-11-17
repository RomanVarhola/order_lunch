class OrderDrink < ApplicationRecord
  belongs_to :drink
  belongs_to :order
end

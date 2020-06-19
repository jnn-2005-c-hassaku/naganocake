class CartItem < ApplicationRecord
	belongs_to :products
	belongs_to :customer

    def total_price
    	cart_item.price * quantity
    end
end

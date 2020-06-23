class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
	def subtotal(price,quantity)
		quantity * (price * 1.10r).ceil
	end
end

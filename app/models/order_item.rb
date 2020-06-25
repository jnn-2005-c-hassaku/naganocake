class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true


	#enum make_status:[:着手不可, :製作待ち, :製作中, :発送済]
	def subtotal(price,quantity)
		quantity * (price * 1.10r).ceil
	end
end

class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true


	enum make_status: {着手不可: 1, 製作待ち:2, 製作中:3, 発送済:4}
	def subtotal(price,quantity)
		(price * quantity).ceil
	end

end

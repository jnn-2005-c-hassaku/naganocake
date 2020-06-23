class ShippingAddress < ApplicationRecord

	belongs_to :customer


	def address_all
		self.direction + self.postcode + self.address
	end
end

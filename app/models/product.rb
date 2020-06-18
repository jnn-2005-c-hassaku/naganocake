class Product < ApplicationRecord
	belongs_to :category
	attachment :image, destroy: false


	#税込価格表示
	def price_with_tax(price)
		(price * 1.10r).ceil
	end
end

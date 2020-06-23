class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy
	attr_accessor :newaddress,:pay_types,:postcode3,:address3,:direction3,:address2
end

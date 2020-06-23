class Order < ApplicationRecord
	belongs_to :customer
	attr_accessor :newaddress,:pay_types,:postcode3,:address3,:direction3,:address2
end

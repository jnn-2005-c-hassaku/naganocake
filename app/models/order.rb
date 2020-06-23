class Order < ApplicationRecord
	attr_accessor :newaddress,:pay_types,:postcode3,:address3,:direction3,:address2
	belongs_to :customer
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true
end

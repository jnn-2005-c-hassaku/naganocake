class Customer < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable

	has_many :orders, dependent: :destroy
	has_many :shipping_addresses, dependent: :destroy
	has_many :cart_items, dependent: :destroy

	def active_for_authentication?
	    super && (self.is_deleted == false)
	end

	def name_all
		self.last_name + self.first_name
	end
end

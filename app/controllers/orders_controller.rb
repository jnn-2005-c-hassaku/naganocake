class OrdersController < ApplicationController
	def new
	@order = Order.new
	@orders = Order.where(customer_id: current_customer.id)
	end


def confirm
	@orders = Order.where(customer_id: current_customer.id)
	@order = Order.new

	if params[:pay_types] == "1"
		@order.pay_type = 1
	else
		@order.pay_type = 2
	end

		if params[:newaddress] == "1"
			@order.address = current_customer.address
			@order.postcode = current_customer.postcode
			@order.direction = current_customer.last_name + current_customer.first_name


		elsif params[:newaddress] == "2"
			@shipping_address = ShippingAddress.find_by(id: params[:order][:address2])
			#ShippingAddress.find(params[:order][:address2])でも可能。
			@order.address = @shipping_address.address
			@order.postcode = @shipping_address.postcode
			@order.direction = @shipping_address.direction

		elsif params[:newaddress] == "3"
			@order.address = params[:address3]
			@order.postcode = params[:postcode3]
			@order.direction = params[:direction3]
		end

end

	def create
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		@order.save
		redirect_to order_path(@order)

	end



	def show#本当はサンクスページ
	end


private
	def order_params
		params.require(:order).permit(:address,:postcode,:direction,:buy_status,
			:pay_type,:postage,:total_price,:customer_id,:newaddress,
			:pay_types,:address2,:postcode3,:address3,:direction3)
#
	end




end

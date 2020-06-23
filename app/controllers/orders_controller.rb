class OrdersController < ApplicationController
	def new
	@order = Order.new
	@customer = current_customer
	end


def confirm
	@order = Order.new
	@order.postage = 800
	@customer = current_customer
	#@order.order_items.build ※エラーが出る

	if params[:pay_types] == "1"
		@order.pay_type = 1
	else
		@order.pay_type = 2
	end

		if params[:newaddress] == "1"
			@order.address = @customer.address
			@order.postcode = @customer.postcode
			@order.direction = @customer.last_name + @customer.first_name


		elsif params[:newaddress] == "2"
			@shipping_address = ShippingAddress.find(params[:order][:address2])
			#ShippingAddress.find_by(id: params[:order][:address2])でも可能。
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
		if
		@order.save
		redirect_to thanks_orders_path
	end

	end

	def thanks

	end

	def show
		@orders = Order.find(params[:id])
		@order_items = OrderItem.all
	end

	def index
	 @orders = Order.all
	end


private
	def order_params
		params.require(:order).permit(:address,:postcode,:direction,:buy_status,
			:pay_type,:postage,:total_price,:customer_id, [order_items_attributes: [:order_id, :product_id, :quantity, :make_status, :tax_indlueded_price]])
#
	end


end

class OrdersController < ApplicationController
	def new
		@order = Order.new
		@customer = current_customer
	end


	def confirm
		@order = Order.new
		@order.postage = 800
		@customer = current_customer

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
		#order_itemsのnew設定はここ,これでOrderのcreate時一緒に保存される
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@cart_items.each do |cart_item|
			@order_item = @order.order_items.build
			@product = Product.find_by(id: cart_item.product_id)
			@order_item.product = @product
			@order_item.make_status = "1"
			@order_item.quantity = cart_item.quantity
			@order_item.tax_inclueded_price = @product.price_with_tax(@product.price)
		end
		@order.customer_id = current_customer.id
		if@order.save
			@cart_items.destroy_all#注文確定後、カートを空にする。
			redirect_to thanks_orders_path
		end

	end

	def thanks

	end

	def show
		@order = Order.find(params[:id])
	end

	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	private
	def order_params
		params.require(:order).permit(:address,:postcode,:direction,:buy_status,
			:pay_type,:postage,:total_price,:customer_id, [order_items_attribute: [:product_id, :quantity, :make_status, :tax_indlueded_price]])
	end


end

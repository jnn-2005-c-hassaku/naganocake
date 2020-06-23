class CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.where(customer_id: current_customer.id)
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		if 
			@cart_item.save
			redirect_to cart_items_path
		else
			session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
			@categories = Category.all
			@product = Product.find_by(id: @cart_item.product_id)
			redirect_to product_path(@product.id), flash: {alert: '※個数を選択して下さい'}
		end
	end

	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(cart_item_params)
			flash[:notice] = "カートの中身をを更新しました"
			redirect_to cart_items_path
		else
			render :index
		end
	end

	def destroy
		@cart_items = CartItem.find(params[:id])
		@cart_items.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@cart_items.destroy_all
		redirect_to cart_items_path
	end



	private
	def cart_item_params
		params.require(:cart_item).permit(:product_id, :quantity)
	end
end

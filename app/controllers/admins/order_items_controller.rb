class Admins::OrderItemsController < ApplicationController


	def update
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		redirect_back(fallback_location: admins_order_path)
	end


private
	def order_item_params
			params.require(:order_item).permit(:order_id, :product_id, :quantity, :make_status, :tax_indlueded_price)
	end
end

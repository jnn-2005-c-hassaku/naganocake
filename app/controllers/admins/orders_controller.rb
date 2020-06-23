class Admins::OrdersController < ApplicationController
def index
	@orders = Order.all

end

def show
	@order = Order.find(params[:id])
end

def update
	@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:notice] = "購入ステータスを更新しました"
			redirect_to admins_order_path
		else
			render :show
		end
end




private
	def order_params
		params.require(:order).permit(:address,:postcode,:direction,:buy_status,
			:pay_type,:postage,:total_price,:customer_id,:newaddress,
			:pay_types,:address2,:postcode3,:address3,:direction3)
#
	end





end

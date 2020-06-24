class Admins::OrdersController < ApplicationController
before_action :authenticate_admin!

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
		  redirect_to admins_orders_path
		else
	      render :edit
	    end
	end

	  def destroy
  	@order = Order.find(params[:id])
  	@order.destroy
  	redirect_to admins_orders_path, notice: "successfully delete book!"
  end

	private
		def order_params
			params.require(:order).permit(:address,:postcode,:direction,:buy_status,
				:pay_type,:postage,:total_price,:customer_id,:newaddress,
				:pay_types,:address2,:postcode3,:address3,:direction3, [order_items_attribute: [:product_id, :quantity, :make_status, :tax_indlueded_price]])

		end
end

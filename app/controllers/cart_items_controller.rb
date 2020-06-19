class CartItemsController < ApplicationController

	def index
		@cart_items = CartItem.all
	end

	def destroy
		cart_items = CartItem.find(params[:id])
		cart_items.destroy
		flash[:notice] = "商品を削除しました"
        redirect_to cart_items_path
    end

    def destroy_all
    	cart_items.destroy_all
    	flash[:notice] = "商品を削除しました"
        redirect_to cart_items_path
    end

end

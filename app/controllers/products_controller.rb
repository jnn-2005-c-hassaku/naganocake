class ProductsController < ApplicationController
	def index
		@products = Product.all.page(params[:page])
	end

	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

	#def update
	#    @product = Product.find(params[:id])
	#    @product.update(product_params)
	# render template: "cart_items/add_cart_item"
	#end

 private
def product_params
	params.require(:product).permit(:name,:description,:price,:image,:category_id,:sale_status)
end
end

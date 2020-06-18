class ProductsController < ApplicationController
	def index
		@categories = Category.all
		@products = Product.all.page(params[:page])
	end

	def show
		@categories = Category.all
		@product = Product.find(params[:id])
    end

	def update
	    @product = Product.find(params[:id])
	    @product.update(product_params)
	    redirect_to products_path
	end

 private
  def shipping_address_params
  	params.require(:product).permit(:name,:description,:price,:image,:category_id,:sale_status)
  end
end

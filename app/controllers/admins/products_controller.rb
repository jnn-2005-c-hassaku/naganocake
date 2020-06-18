class Admins::ProductsController < ApplicationController
before_action :authenticate_admin!

def show
	@product = Product.find(params[:id])
end

def index
	@products = Product.all

end

def new
	@product = Product.new
	@categories = Category.all
end


def create
	@product = Product.new(product_params)
	@product.save
	redirect_to admins_products_path

end

def edit
	@product = Product.find(params[:id])
	@categories = Category.all
end



def update
	@product = Product.find(params[:id])
	@product.update(product_params)
	redirect_to admins_products_path
end

def destroy
	@product = Product.find(params[:id])
	@product.destroy
	redirect_to admins_products_path
end

private

def product_params
	params.require(:product).permit(:name,:description,:price,:image,:category_id,:sale_status)
end



end

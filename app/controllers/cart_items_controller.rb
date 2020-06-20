class CartItemsController < ApplicationController
def index

@cart_items = CartItem.all

end

def create
@cart_item = CartItem.new(cart_item_params)
@cart_item.customer_id = current_customer.id
#if 
@cart_item.save
redirect_to cart_items_path
#else
#session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
#@categories = Category.all
#@product = Product.find_by(id:@cart_item.product_id)
#redirect_to product_path(@product.id), flash: {alert: '※個数を選択して下さい'}
#end
end


private
def cart_item_params
params.require(:cart_item).permit(:product_id, :quantity)
end

def product_params
params.permit(:name,:description,:price,:image,:category_id,:sale_status)
end

end

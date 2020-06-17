class Admins::CategoriesController < ApplicationController
	before_action :authenticate_admin!

	def index
		@category = Category.new
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "You have creatad category successfully."
			redirect_to admins_categories_path
		else
			@categories = Category.all
			render 'index'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:notice] = "You have updated category successfully."
			redirect_to admins_categories_path
		else
			render 'edit'
		end
	end

	private
	def category_params
		params.require(:category).permit(:name, :active_status, :product_id)
	end

end
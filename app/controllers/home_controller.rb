class HomeController < ApplicationController
	def top
		@categories = Category.all
	end
end

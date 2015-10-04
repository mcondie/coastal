class HomeController < ApplicationController
	def index
		render
	end

	def category
		@category = Category.find(params[:id])
	end

	def portfolio

	end
end
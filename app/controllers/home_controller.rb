class HomeController < ApplicationController
	def index
		@photos = Photo.where("homepage = true")
		render
	end

	def category
		@category = Category.find(params[:id])
	end

	def portfolio
		@categories = Category.all
	end

	def photo
		@photo = Photo.find(params[:id])
	end
end
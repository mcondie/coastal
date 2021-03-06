class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_menu

  def set_menu
  	@categories = Category.all
  	@pages = Photo.all
  	@pages.each do |page|
  		page.noteField = ''
  		page.notes.each do |note|
  			page.noteField = page.noteField + ' ' + note.description + ' ' + note.name
  		end
  	end
  end
end

class HierarchyController < ActionController::Base
	def add 
		print params['category[id]']
		@photo = Photo.find(params['category[photo_id]'])
		redirect_to edit_admin_photo(@photo)
	end

	def delete
	end
end
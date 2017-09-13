class HomesController < ApplicationController

	def index
		if model_signed_in?
    		@user = current_model.id
			@albums = Photo_album.where(model_id:@user).all
			@photo_album = Photo_album.new
		end
		
	end

	def new
	    @photo = current_model.photos.build
	end

end
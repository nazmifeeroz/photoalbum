class HomesController < ApplicationController

	def index
		if user_signed_in?
    		@user = current_user.id
			@albums = Album.where(user_id:@user).all
			@album = Album.new
			@photo = Photo.new
		end
		
	end

	def new
	    @photo = current_user.photos.build
	end

end
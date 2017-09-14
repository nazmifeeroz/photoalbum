class PhotosController < ApplicationController

	def new
		@album = Album.find(params[:album_id])
		@photo = Photo.new
	end

	def create

		@album_id = Album.find(params[:album_id])
		photo_params = params.require(:photo).permit(:photoname, :date, :description, :image)
		photo = Photo.new(photo_params)
		photo.album_id = @album_id.id
		# byebug
		if photo.save
			flash[:success] = "New Photo added."
		else
			byebug
			flash[:danger] = "New Photo not added."
		end
		redirect_to root_path
	end

	def show
		@photo = Photo.find(params[:id])
	end
end
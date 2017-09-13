class PhotoAlbumsController < ApplicationController

	def create
		
		photo_album_params = params[:photo_album].permit(:album_name, :Description)
		photoAlbum = Photo_album.new(photo_album_params)
		photoAlbum.model_id = current_model.id
		# photoAlbum = current_model.photo_albums.build(photo_album_params)
		if photoAlbum.save
			flash[:success] = "Album Created!"
		else
			flash[:danger] = "Album not created!"
		end
		redirect_to root_path
	end

	def destroy
		album = Photo_album.find(params[:id])
		if album.destroy
			flash[:success] = "Album Deleted."
		else
			flash[:danger] = "Album not Deleted."
		end
		redirect_to root_path
	end

end
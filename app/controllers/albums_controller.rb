class AlbumsController < ApplicationController

	def create
		
		album_params = params[:album].permit(:albumname, :description)
		album = Album.new(album_params)
		album.user_id = current_user.id
		# photoAlbum = current_model.photo_albums.build(photo_album_params)
		if album.save
			flash[:success] = "Album Created!"
		else
			flash[:danger] = "Album not created!"
		end
		redirect_to root_path
	end

	def destroy
		album = Album.find(params[:id])
		if album.destroy
			flash[:success] = "Album Deleted."
		else
			flash[:danger] = "Album not Deleted."
		end
		redirect_to root_path
	end

end
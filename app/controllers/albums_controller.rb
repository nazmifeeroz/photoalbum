class AlbumsController < ApplicationController

	def index
		if user_signed_in?
    		initall
		end

		@allpublic = Album.where(private:1).ids
		@photos = Photo.all.order(:created_at).reverse
		


	end

	def show
		if user_signed_in?
    		initall
		else
			redirect_to root_path
		end

	end

	def new
		initall
		
	    @photo = current_user.photos.build
	end

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
		redirect_to album_path(id: current_user.id)
	end

	def update

		private_param = params[:private]
		album = Album.find(params[:id])
		album.update(private:private_param)
		if album.private != 1
			flash[:success] = "Album Privatised!"
		else
			flash[:danger] = "Album in public view!"
		end
		redirect_to album_path(id: current_user.id)
	end

	def destroy
		album = Album.find(params[:id])
		if album.destroy
			flash[:success] = "Album Deleted."
		else
			flash[:danger] = "Album not Deleted."
		end
		redirect_to album_path(id: current_user.id)
	end

	private
	def initall
		@user = current_user.id
		usernamee = current_user.email
		@username, *rest = usernamee.split(/@/)
		@albums = Album.where(user_id:@user).all
		@album = Album.new
		@photo = Photo.new
	end

end
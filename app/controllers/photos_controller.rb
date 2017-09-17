class PhotosController < ApplicationController

	def new
		@album = Album.find(params[:album_id])
		@photo = Photo.new
	end

	def create

		@album_id = Album.find(params[:album_id])
		photo_params = params.require(:photo).permit(:photoname, :image, :private)
		photo = Photo.new(photo_params)
		photo.album_id = @album_id.id

		# byebug
		if photo.save
			flash[:success] = "New Photo added."
		else
			# byebug
			flash[:danger] = "New Photo not added."
		end
		redirect_to album_path(id: @album_id)
	end

	def show
		initall
		@photo = Photo.find(params[:id])
		@album_id = params[:album_id]
		@id = params[:id]
		@current = Album.find_by(id:params[:album_id])
		username_param = Album.find_by(id:@current).user_id
		useremail = User.find_by(id:username_param).email
		@useremail, *rest = useremail.split(/@/)

		@comment = @photo.comments.build
		@comments = Comment.where(photo_id: @id)
		# if !comments.empty?
		# 	@photocomment = comments.find_by(photo_id: @photo_id)
		# end

	end

	def destroy

		photo = Photo.find(params[:id])
		if photo.destroy
			flash[:success] = "Photo Deleted."
		else
			flash[:danger] = "Photo not Deleted."
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
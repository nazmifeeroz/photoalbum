class CommentsController < ApplicationController

	def create

		photo = Photo.find(params[:photo_id])
		comment_params = params.require(:comment).permit(:userid, :body)
		comment = photo.comments.new(comment_params)
		comment.user_id = current_user.id
		if comment.save
			flash[:success] = "New Comment added."
		else
			byebug
			flash[:danger] = "New Comment not added."
		end
		redirect_to album_photo_path(album_id: params[:album_id], id: params[:photo_id])

	end



end
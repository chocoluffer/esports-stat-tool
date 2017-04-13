class CommentsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "musux", only: :destroy

	def create
		@player = Player.find(params[:player_id])
		@comment = @player.comments.create(comment_params)
		redirect_to player_path(@player)
	end

	def destroy
		@player = Player.find(params[:player_id])
		@comment = @player.comments.find(params[:id])
		@comment.destroy
		redirect_to player_path(@player)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end

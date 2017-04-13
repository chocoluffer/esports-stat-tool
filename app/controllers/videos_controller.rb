class VideosController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "musux", except:
	[:index, :show]

	def index
		@videos = Video.all
	end

	def show
		@video = Video.find(params[:id])
	end

	def new
	end

	def create
		@video = Video.new(video_params)
		# Check if ID provided has a video associated with it, and if so store that ID

		@video.save
		redirect_to @video
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy

		redirect_to videos_path
	end

	def check_valid_id
		@video = Video.find(params[:id])

		# Call https://api.twitch.tv/kraken/videos/<video ID>

		# If the Twitch stored ID returns nil, 
		# display an error and ask if they would like to delete this video

		# Else, return true
	end

	private
		def video_params
			params.require(:video).permit(:title, :date)
		end
end

class SongsController < ApplicationController
    def index
        @song = Song.all 
    end

    def create
        @song = Song.new(song_params)
        @song.save
        redirect_to song_path(@song)
    end

    def new
        @song = Song.new
    end

    def edit
        # find_song
        @song = Song.find(params.require(:id))

    end
    
    def show
        # find_song
        @song = Song.find(params[:id])
    end
    
    def update
        # find_song
        @song = Song.find(params.require(:id))
        @song.update(song_params)
        @song.save
        redirect_to song_path(@song)
    end
    
    private
    
    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
    
    def find_song
        @song = Song.find(params.require(:id))
    end
end
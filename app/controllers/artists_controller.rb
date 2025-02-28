class ArtistsController < ApplicationController
    def index
        @artist = Artist.all 
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end

    def new
        @artist = Artist.new
    end

    def edit
        find_artist
    end
    
    def show
        find_artist
    end
    
    def update
        find_artist
        @artist.update(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end
    
    private
    
    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
    
    def find_artist
        @artist = Artist.find(params.require(:id))
    end
end
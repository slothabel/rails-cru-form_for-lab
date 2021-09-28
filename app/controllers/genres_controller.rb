class GenresController < ApplicationController
    def index
        @genre = Genre.all 
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end

    def new
        @genre = Genre.new
    end

    def edit
        find_genre
    end
    
    def show
        find_genre
    end
    
    def update
        find_genre
        @genre.update(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
    
    def find_genre
        @genre = Genre.find(params.require(:id))
    end
end
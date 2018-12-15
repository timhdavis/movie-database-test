module MoviesHelper

    def shortened_title(movie)
        title_text = "View Movie"

        if (movie.title)
            title_text = movie.title.truncate(20).to_s
        end
        
        return title_text
    end
end

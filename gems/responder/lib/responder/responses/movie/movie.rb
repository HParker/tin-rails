# frozen_string_literal: true
require 'themoviedb'

module Responder
  class Movie < Base
    KEYWORD = 'movie'

    keyword KEYWORD, info: "[title] show info about a film"

    def title
      KEYWORD
    end

    def contents
      if movie_info
        {
          title: movie_info.title,
            poster_path: poster_path,
            release_date: movie_info.release_date,
            vote_average: movie_info.vote_average,
            overview: movie_info.overview,
            id: movie_info.id
        }
      else
        {
          title: 'Movie not found',
            poster: poster_path,
            release_date: 'n/a',
            vote_average: '0',
            overview: 'The best movie never made.',
            id: '0'
        }
      end
    end

    def initialize(info)
      @info = info
    end

    private

    def poster_path
      if movie_info && movie_info.poster_path
        "https://image.tmdb.org/t/p/w396/#{movie_info.poster_path}"
      else
        '/no-poster.jpg'
      end
    end

    def movie_info
      @movie_info ||= get_movie_info
    end

    def get_movie_info
      Tmdb::Api.key(ENV['TMDB_KEY'])
      @info.has_contents? && Tmdb::Movie.find(@info.contents).first
    end
  end
end

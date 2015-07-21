require 'imdb'

class Imdb2
	attr_accessor :title, :arr, :num
	def search_title(title)
		i = Imdb::Search.new(title)
		i.movies.size
	end

	def most_seasons_from(arr)

  	end

  	def most_episodes(arr)

  	end

  	def best_rating(arr)
  	end

  	def top_movies(num)
  	end

end



__END__


Note: if you grab results from Imdb::Search, it will always return a Imdb::Movie object, not Imdb::Serie. In order to get info an Imdb::Serie,
which has information like the number of episodes, just use the id to fetch the serie directly:

  dexter_movie = Imdb::Search.new(‘Dexter’).movies.first
  dexter_serie = Imdb::Serie.new(dexter_movie.id)


# dexter_movie = Imdb::Search.new("Dexter").movies.first
# dexter_serie = Imdb::Serie.new(dexter_movie.id)

# p dexter_serie

# mf = Imdb::Search.new('Modern Family').movies.first
# mf2 = Imdb::Serie.new(mf.id)
mf2.title

# to use the instance of the actual serie

# 











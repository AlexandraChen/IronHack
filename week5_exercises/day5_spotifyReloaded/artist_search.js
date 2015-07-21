//var AlbumsSearch = require('./albums_search.js')

var ArtistSearch = function(){
	this.url = 'https://api.spotify.com/v1/search?type=artist&'
	this.setListeners()
}

ArtistSearch.prototype.setListeners = function(){
	var artist = this
	$(".artistInput").on("click", function(event){
		event.preventDefault();
		$(".artistInput").val("")
		$(".results").empty()
	})
	$("#btn-search-artist").on("click", function(event){
		event.preventDefault()
		artist.fetch()
	})	
}

ArtistSearch.prototype.fetch = function(){
	var searchTerm = $(".artistSearch").serialize()
	var request = $.get(this.url + searchTerm)
	var artist = this  //bind when we are passing a callback function
	request.done(function (artistsResults) {
		var artists = artistsResults.artists.items
		artist.render(artists)
	})
}

ArtistSearch.prototype.render = function(artists){
	$(".artistSearch").after(this.template(artists))
}

ArtistSearch.prototype.template = function(artists){
if(artists.length !== 0){
		artists.forEach(function(artist){
			if(artist.images[0]){
				$(".results").append("<p class='artists'><img src=" + artist.images[0].url + "><br><a data-id=" + artist.id + ">" 
					+ artist.name + "</a></p><br>")
			} else {
				$(".results").append("<p class='artists'><a data-id=" + artist.id + ">" + artist.name + "</a></p><br>")
			}
		})
		var albums = new AlbumsSearch(artists)
	} else {
		alert("No valid matches!");
	}
}





























































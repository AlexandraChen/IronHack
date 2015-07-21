var AlbumsSearch = function(artists){
	this.artists = artists
	this.url = "https://api.spotify.com/v1/artists/"
	this.setListeners()
}

AlbumsSearch.prototype.setListeners = function(){
	var albums = this
	$(".results").on("click","a",function(event){
		event.preventDefault();
		var artistId = event.target.dataset.id
		albums.fetch(event,artistId)
	})
}

AlbumsSearch.prototype.fetch = function(event,artistId){
	var request = $.get(this.url + artistId + "/albums")
	request.done(function(albums){
		var albums = albums.items
		this.render(albums,event)
	}.bind(this))
}

AlbumsSearch.prototype.render = function(albums, event){
	console.log(albums)
	$(event.currentTarget.parentElement).append(this.template(albums));
}

AlbumsSearch.prototype.template = function(albums){
	$(".albums").empty()
	var albumsList = "<ul class='albums'>"
	albums.forEach(function(album){
		albumsList += "<li><em><a data-id="+ album.id + ">" + album.name + "</a></em></li>";	
	});
	albumsList += "</ul>"
	return albumsList
}



var SongSearch = function(){
	this.url = 'https://api.spotify.com/v1/search?type=track&'
	this.setListeners()
}

SongSearch.prototype.setListeners = function(){
	var track = this
	$(".trackInput").on("click", function(event){
		event.preventDefault();
		$(".trackInput").val("")
		$(".tracks").empty()
	})
	$("#searchTrack").on("click", function(event){
		event.preventDefault()
		var searchTerm = $(".searchTrack").serialize()
		track.fetch(searchTerm)
	})	
}

SongSearch.prototype.fetch = function(searchTerm){
	var request = $.get(this.url + searchTerm)
	var track = this  //bind when we are passing a callback function
	request.done(function (trackResults) {
		var tracks = trackResults.tracks.items
		track.render(tracks)
	})
}

SongSearch.prototype.render = function(tracks){
	this.template(tracks)
}

SongSearch.prototype.template = function(tracks){
	if(tracks.length !== 0){
		tracks.forEach(function(track){
			$(".searchTrack").after("<p class='tracks'><a data-id=" + track.id + ">" + track.artists[0].name + " -  " + track.name + "</a></p>")
		})
	} else {
		alert("No valid matches!");
	}
}















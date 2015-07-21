
function handleSearch(search){
	console.log("Request done!", search);
	var artistItems = search.artists.items;
	if(artistItems.length !== 0 ) {
		artistItems.forEach(function(artist){
			if(artist.images[0]){
				$(".result").append("<li>"+"<em><a data-id=" + artist.id + ">" + artist.name + "</a></em>" + "<br>" + "<img src=" + search.artists.items[0].images[0].url + "></li>" );	
			} else {
				$(".result").append("<li><em>" + artist.name + "</em></li>");	
			}
		});

	} else {
		alert("No valid matches!");
	}
}

$("#search").click(function(event){
	event.preventDefault();
	var artist = $("form").serialize();

	var request = $.get('https://api.spotify.com/v1/search?type=artist&' + artist);
	request.done(handleSearch);
});

function handleAlbums(albums, event){
	$("#albumOfArtist").html("");
	$(".albums").empty();
	console.log("Request albums!", albums);
	var albums = albums.items;
	var albums_ul = "<ul>";

	albums.forEach(function(album){
		albums_ul += "<li><a data-id="+ album.id + ">" + album.name + "</a></li>";	
	});
	albums_ul += "</ul>";
	$(event.currentTarget.parentElement).append(albums_ul);
}

$("#results_albums").on ("click", "a",function(event){
	//debugger;
    event.preventDefault();
    var artistid = event.target.dataset.id 
    var request = $.get("https://api.spotify.com/v1/artists/" + artistid + "/albums");
    request.done(function(albums) {
    	handleAlbums(albums, event)
    });
});
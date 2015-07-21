function fileactions(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file)
    //sorting by episode number
    episodes = sortByKey(episodes, "episode_number");
    //filtering 8.5 and higher ratings
    // episodes = filterByRating(episodes, "rating");
    //find Jon Snow episodes
    episodes = searchFor(episodes,"description","Jon");
    //formating episodes
    episodes.forEach(function (episodeInfo) {
    	episodeparser(episodeInfo);
    })
}

function episodeparser(episode){
    	console.log("Title: " + episode.title + " Episode: " + episode.episode_number);
    	console.log(episode.description);
    	console.log("Rating: "+ episode.rating + " " + stars(episode.rating));
    	console.log();
};

function stars(episode_rating){
	var stars = "";
	for(var i = 1; i<=episode_rating; i++){
		stars += "*";
	}
	return stars;
};


function sortByKey(array, key) {
    return array.sort(function(a, b) {
        return ((a[key] < b[key]) ? -1 : ((a[key] > b[key]) ? 1 : 0)); 
    });
}

function filterByRating(array,key){
    return array.filter(function(episode){
        return (episode[key] >= 8.5);
    });
}

function searchFor(episodes,key,character){
    return episodes.filter(function(episode){
        return(episode[key].indexOf(character) > -1); //episode[key].contains(character) ???
    });
}


module.exports = fileactions;

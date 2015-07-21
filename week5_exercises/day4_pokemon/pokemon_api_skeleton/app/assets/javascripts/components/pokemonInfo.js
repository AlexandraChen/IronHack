var PokemonInfoComponent = function (container, pokemon){
	this.pokemon = pokemon
	this.container = container
}

PokemonInfoComponent.prototype.template = function(pokemon){
	return "<h2 class='pokeName'>" + pokemon.name + "</h2><p class='pokeInfo'>" 
	+ "<br>Height: " + pokemon.height + "<br>Weight: " + pokemon.weight 
	+ "<br>Speed: " + pokemon.speed + "</p>" +  "<a class='pokeType'> Type of Pokèmon </a>"
}

PokemonInfoComponent.prototype.render = function(){
	this.container.append(this.template(this.pokemon))
}

module.exports = PokemonInfoComponent
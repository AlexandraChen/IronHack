var PokemonTypeComponent = function (container, pokemon){
	this.container = container
	this.pokemon = pokemon
}

PokemonTypeComponent.prototype.template = function(pokemon){
	var pokeType = "<ul>"
	this.pokemon.types.forEach(function(type){
		pokeType += "<li>" + type.name + "</li>"
	})
	pokeType += "</ul>"
	return pokeType
}

PokemonTypeComponent.prototype.render = function(){
	this.container.append(this.template(this.pokemon))
}

module.exports = PokemonTypeComponent
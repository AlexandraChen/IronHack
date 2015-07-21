function PokemonComponent(container, pokemon){
	this.container = container	
	this.pokemon = pokemon
}

PokemonComponent.prototype.template = function(pokemon){
	return "<p><a class='pokemon' data-id=" + this.pokemon.id + ">" + this.pokemon.name + "</a></p>"
}

PokemonComponent.prototype.render = function(){
	this.container.append(this.template(this.pokemon))
}

module.exports = PokemonComponent
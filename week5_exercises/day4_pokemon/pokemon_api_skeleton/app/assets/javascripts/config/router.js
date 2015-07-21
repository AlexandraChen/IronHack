var Pokemon = require('../models/pokemon.js')
var PokemonComponent = require('../components/pokemon.js')
var PokemonInfoComponent = require('../components/pokemonInfo.js')
var PokemonTypeComponent = require('../components/pokemonType.js')

var Router = function($container){
	this.$container = $container
	this.setInitialListeners()
}

Router.prototype.setInitialListeners = function () {
	var router = this
	$("#searchPokemon").click(function(event){
		event.preventDefault()
		$(".showPokemon").empty()
		var pokeId = $("form").serializeArray()[0].value
		$(".pokeSearch").val("")
		router.renderContainer(pokeId) 
	})
}

Router.prototype.renderContainer = function(id){
	var pokemon = new Pokemon(id)
	var pokemonContainer = new PokemonComponent(this.$container,pokemon)
	var router = this
	// pokemon.fetch(pokemonContainer.render.bind(pokemonContainer))
	pokemon.fetch(function(){
		pokemonContainer.render();
		router.setPokemonListener(pokemon)
	});
}

Router.prototype.setPokemonListener = function(pokemon){
	var router = this
	$(".pokemon").on("click", function(event){
		event.preventDefault()
		$(".showPokemon").empty()
		router.renderPokemonInfo(pokemon)
	})
}

Router.prototype.renderPokemonInfo = function(pokemon){
	var router = this
	var pokemonInfoContainer = new PokemonInfoComponent(this.$container, pokemon)
	pokemonInfoContainer.render()
	router.setPokemonType(pokemon)
}

Router.prototype.setPokemonType = function(pokemon){
	var router = this
	$(".pokeType").on("click", function(event){
		event.preventDefault()
		console.log("Where are my typeS?")
		router.renderPokemonType(pokemon)
	})
}

Router.prototype.renderPokemonType = function(pokemon){
	var pokemonTypeContainer = new PokemonTypeComponent(this.$container, pokemon)
	pokemonTypeContainer.render()
}


module.exports = Router























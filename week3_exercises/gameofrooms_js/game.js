var Room = require('./room.js');
var read = require('read');

var Game = function(rooms){
	this.rooms = rooms;
	this.index_location = 0;
	this.current_location = rooms[this.index_location];
	this.status = true;
}

Game.prototype.add_room = function(new_room){
	this.rooms.push(new_room);
}

Game.prototype.start = function(){
	console.log("Are you ready? Let's start!");
	this.getCommand();
}

Game.prototype.getCommand = function(){
	console.log(this.current_location.description + " " + this.current_location.hint);
	options = {
		prompt: "Input a command \n >"
	};
	// if(this.status === true){
	read(options,this.checkCommand.bind(this));
	// }else if (this.status === false){
	// 	console.log("You LOST! ");
	// }
};

Game.prototype.checkCommand = function (err,command){
	if(err){
		throw err;
	}
	var valid_commands = ["N","S","E","W"];
	var valid_actions = [];
	this.rooms.forEach(function(rooms){valid_actions.push(rooms.action)});

	if(valid_commands.indexOf(command) > -1){
		this.processCommand(command);
	} else if (valid_actions.indexOf(command) > -1) {
		this.processAction(command);
	} else if(command === "exit"){
		console.log("You have just exit the game. See you!")
	}else {
		console.log("Invalid command. Please input a valid command.")
		read(options, this.checkCommand.bind(this));
	}
}

Game.prototype.processCommand = function (command){ 
	if (command === this.current_location.answer){
		this.index_location += 1;
		this.current_location = this.rooms[this.index_location];
	} else {
		console.log("There is no exit there!" + this.current_location.hint);
	};
	this.getCommand();
}

Game.prototype.processAction = function(action){
	if (action === "Buy food"){
		this.index_location += 1;
		this.current_location = this.rooms[this.index_location];
		console.log(this.current_location);
		this.getCommand();
	} else if (action === "Chill"){
		console.log("Enjoy! See you next time.");
	}
}


module.exports = Game;



















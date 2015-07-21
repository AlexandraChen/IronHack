var Room = require('./room.js');
var Game = require('./game.js');
var read = require('read');

var dark_room = new Room("N","You are in a dark room","The door is at the north");
var kitchen = new Room("E","You are the kitchen","There is no food, you can Buy food","Buy food");
var noisy_room = new Room("E","You are in a noisy room", "There is a door at east");
var market = new Room("E","You are in a super market","To go back home go east");
var living_room = new Room("", "You are in the living room", "You can just Chill", "Chill");

var rooms = [dark_room, noisy_room, kitchen, market, living_room];

var new_game = new Game(rooms);
// new_game.add_room(dark_room);
// new_game.add_room(kitchen);
// new_game.add_room(noisy_room);

new_game.start();




